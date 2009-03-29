grammar ExcelFormula;

options {
    language  = Ruby;
    k = 2;
}

@header {
  RVA_DELTA = {"R" => 0, "V" => 0x20, "A" => 0x40}
}

@init {
  @rpn = ''
  @sheet_references = []
  @xcall_references = []
}

@members {
  attr_accessor :rpn
}

formula
    : expr["V"]
    ;

expr[arg_type]
    : prec0_expr[arg_type]
        (
            (
                  EQ { op = [PTGEQ].pack('C') }
                  
/*                | NE { op = [PTGNE].pack('C') }
                | GT { op = [PTGGT].pack('C') }
                | LT { op = [PTGLT].pack('C') }
                | GE { op = [PTGGE].pack('C') }
                | LE { op = [PTGLE].pack('C') }*/
                
            )
            prec0_expr[arg_type] { @rpn += op }
        )*
    ;

prec0_expr[arg_type]
    : prec1_expr[arg_type]
        (
            (
                CONCAT { op = [PTGCONCAT].pack('C') }
            )
            prec1_expr[arg_type] { @rpn += op }
        )*
    ;

prec1_expr[arg_type]
    : prec2_expr[arg_type]
        (
            (
                  ADD { op = [PTGADD].pack('C') }
                | SUB { op = [PTGSUB].pack('C') }
            )
            prec2_expr[arg_type] { @rpn += op }
        )*
    ;


prec2_expr[arg_type]
    : prec3_expr[arg_type]
        (
            (
                  MUL { op = [PTGMUL].pack('C') }
                | DIV { op = [PTGDIV].pack('C') }
            )
            prec3_expr[arg_type] { @rpn += op }
        )*
    ;

prec3_expr[arg_type]
    : prec5_expr[arg_type]
        (
            (
                POWER { op = [PTGPOWER].pack('C') }
            )
            prec5_expr[arg_type] { @rpn += op }
        )*
    ;

prec4_expr[arg_type]
    : prec5_expr[arg_type]
        (
            PERCENT { @rpn += [PTGPERCENT].pack('C') }
        )?
    ;

prec5_expr[arg_type]
    : primary[arg_type]
    | SUB primary[arg_type] { @rpn += [PTGUMINUS].pack('C') }
    ;

primary[arg_type]
    : TRUE_CONST
        {
            @rpn += [PTGBOOL, 1].pack("C2")
        }
    | FALSE_CONST
        {
            @rpn += [PTGBOOL, 0].pack("C2")
        }
    | str_tok = STR_CONST
        {
            @rpn += [PTGSTR].pack('C') + upack1(str_tok.text[1, -1]) #TODO
        }
    | int_tok = INT_CONST
    {
        int_value = int_tok.text.to_i
        if int_value <= 65535
            @rpn += [PTGINT, int_value].pack("Cv")
        else
            @rpn += [PTGNUM, int_value.to_f].pack("CE")
        end
    }
    | num_tok = NUM_CONST
        {
            @rpn += [ptgNum, num_tok.text.to_f].pack("CE")
        }
    | ref2d_tok = REF2D
        {
          r, c = Utils.cell_to_packed_rowcol(ref2d_tok.text) # TODO
          ptg = PTGREFR + RVA_DELTA[arg_type]
          @rpn += [ptg, r, c].pack("Cv2")
        }
    | ref2d1_tok = REF2D COLON ref2d2_tok = REF2D
        {
            r1, c1 = Utils.cell_to_packed_rowcol(ref2d1_tok.text) #TODO
            r2, c2 = Utils.cell_to_packed_rowcol(ref2d2_tok.text) #TODO
            ptg = PTGAREAR + RVA_DELTA[arg_type]
            self.rpn += struct.pack("Cv4", ptg, r1, r2, c1, c2)
        }
/*    | sheet1 = sheet
        { 
            sheet2 = sheet1
        }
        ( COLON sheet2 = sheet )? BANG ref3d_ref2d=REF2D
        {
            ptg = PTGREF3DR + RVA_DELTA[arg_type]
            rpn_ref2d = ""
            r1, c1 = Utils.cell_to_packed_rowcol(ref3d_ref2d.text) #TODO
            rpn_ref2d = [0x0000, r1, c1].pack("v3")
        }
        ( COLON ref3d_ref2d2= REF2D
            {
                ptg = PTGAREA3DR + RVA_DELTA[arg_type]
                r2, c2 = Utils.cell_to_packed_rowcol(ref3d_ref2d2.text) #TODO
                rpn_ref2d = [0x0000, r1, r2, c1, c2].pack("v5")
            }
        )?
        {
            @rpn += [ptg].pack("C")
            @sheet_references << [sheet1, sheet2, @rpn.size]
            @rpn += rpn_ref2d
        }
        | FUNC_IF
        LP expr["V"] (SEMICOLON | COMMA)
        {
            @rpn += [PTGATTR, 0x02, 0].pack("C2v") # tAttrIf
            pos0 = @rpn.size - 2
        }
        expr[arg_type] (SEMICOLON | COMMA)
        {
            @rpn += [PTGATTR, 0x08, 0].pack("C2v") # tAttrSkip
            pos1 = @rpn.size - 2
            @rpn = @rpn[0...pos0] + [pos1-pos0].pack("v") + @rpn[pos0+2...-1] # TODO
        }
        expr[arg_type] RP
        {
            @rpn += [PTGATTR, 0x08, 3].pack("C2v") # tAttrSkip
            @rpn += [PTGFUNCVARR, 3, 1].pack("C2v") # 3 = nargs, 1 = IF func
            pos2 = @rpn.size
            @rpn = @rpn[0...pos1] + [pos2-(pos1+2)-1].pack("v") + @rpn[pos1+2...-1] # TODO
        }
        | FUNC_CHOOSE
        {
            arg_type = "R"
            rpn_chunks = []
        }
        LP expr["V"] // first argument (the selector)
        {
            rpn_start = @rpn.size
            ref_markers = [@sheet_references.size]
        }
        (
            (SEMICOLON | COMMA)
                { mark = @rpn.size }
                (
                  expr[arg_type]
                | { @rpn += [PTGMISSARG].pack("C") }
                )
                {
                    rpn_chunks.append(@rpn[mark...-1])
                    ref_markers.append(@sheet_references.size)
                }
        )*
        RP
        {
            # TODO test this, no idea if it works, just blindly translated
            @rpn = @rpn[0...rpn_start]
            nc = rpn_chunks.size
            chunklens = rpn_chunks.collect {|c| c.size}
            skiplens = [0] * nc
            skiplens[-1] = 3

            (nc-1).downto(1) do |i|
              skiplens[i-1] = skiplens[i] + chunklens[i] + 4
            end
            jump_pos = [2 * nc + 2]

            (0...nc).each do |i|
              jump_pos.append(jump_pos[-1] + chunklens[ic] + 4)
            end
            chunk_shift = 2 * nc + 6 # size of tAttrChoose

            (0...nc).each do |i|
              (ref_markers[i]...ref_markers[i+1]).each do |r|
                ref = @sheet_references[r]
                @sheet_references[r] = [r[0], r[1], r[2] + chunk_shift]
              end
              chunk_shift += 4 # size of tAttrSkip
            end

            choose_rpn = []
            choose_rpn.append([PTGATTR, 0x04, nc].pack("CCv")) # 0x04 is tAttrChoose
            choose_rpn.append(jump_pos.pack("v*"))
            
            (0...nc).each do |i|
              choose_rpn << rpn_chunks[i]
              choose_rpn << [PTGATTR, 0x08, skiplens[i]].pack("CCv") # 0x08 is tAttrSkip
            end
            choose_rpn.append([PTGFUNCVARV, nc+1, 100].pack("CCv")) # 100 is CHOOSE fn
            @rpn += choose_rpn.join
        }

    | name_tok = NAME
        {
            raise "[formula] found unexpected NAME token #{name_tok.text}"
            # TODO: handle references to defined names here
        }
    | func_tok = NAME
        {
          raise "not implemented"
         # func_toku = func_tok.text.upper()
         # if func_toku in all_funcs_by_name:
         #     (opcode,
         #     min_argc,
         #     max_argc,
         #     func_type,
         #     arg_type_str) = all_funcs_by_name[func_toku]
         #     arg_type_list = list(arg_type_str)
         # else:
         #     raise Exception("[formula] unknown function #{func_tok.text}")
         # xcall = opcode < 0
         # if xcall:
         #     # The name of the add-in function is passed as the 1st arg
         #     # of the hidden XCALL function
         #     self.xcall_references.append((func_toku, len(self.rpn) + 1))
         #     self.rpn += struct.pack("<BHHH",
         #         ptgNameXR,
         #         0xadde, # ##PATCHME## index to REF entry in EXTERNSHEET record
         #         0xefbe, # ##PATCHME## one-based index to EXTERNNAME record
         #         0x0000) # unused
        }
        LP arg_count = expr_list[arg_type_list, min_argc, max_argc] RP
        {
          raise "not implemented"
         # if arg_count > max_argc or arg_count < min_argc:
         #     raise Exception, "#{arg_count} parameters for function: #{func_tok.text}"
         # if xcall:
         #     func_ptg = ptgFuncVarR + _RVAdelta[func_type]
         #     self.rpn += struct.pack("<2BH", func_ptg, arg_count + 1, 255) # 255 is magic XCALL function
         # elif min_argc == max_argc:
         #     func_ptg = ptgFuncR + _RVAdelta[func_type]
         #     self.rpn += struct.pack("<BH", func_ptg, opcode)
         # elif arg_count == 1 and func_tok.text.upper() == "SUM":
         #     self.rpn += struct.pack("<BBH", ptgAttr, 0x10, 0) # tAttrSum
         # else:
         #     func_ptg = ptgFuncVarR + _RVAdelta[func_type]
         #     self.rpn += struct.pack("<2BH", func_ptg, arg_count, opcode)
        }
    | LP expr[arg_type] RP
        {
            @rpn += [PTGPAREN].pack('C')
        }
    ;

expr_list[arg_type_list, min_argc, max_argc] returns [arg_cnt]
@members{
        arg_cnt = 0
        arg_type = arg_type_list[arg_cnt]
    }
    : expr[arg_type] { arg_cnt += 1 }
    (
        {
            if arg_cnt < arg_type_list.size
                arg_type = arg_type_list[arg_cnt]
            else
                arg_type = arg_type_list[-1]
            end
            if arg_type == "+"
                arg_type = arg_type_list[-2]
            end
        }
        (SEMICOLON | COMMA)
            (
                  expr[arg_type]
                | { @rpn += [PTGMISSARG].pack("B") }
            )
            { arg_cnt += 1 }
    )*
    |
    ;
    
sheet returns[ref]
    : sheet_ref_name = NAME
      { ref = sheet_ref_name.text }
    | sheet_ref_int = INT_CONST
      { ref = sheet_ref_int.text }
    | sheet_ref_quote = QUOTENAME
      { ref = sheet_ref_quote.text[1..-1].replace("''", "'") # TODO }
    ;

*/

;

fragment
EQ: '=';
LT: '<';
GT: '>';
NE: '<>';
LE: '<=';
GE: '>=';

ADD: '+';
SUB: '-';
MUL: '*';
DIV: '/';

COLON: ':';
SEMICOLON: ';';
COMMA: ',';

LP: '(';
RP: ')';
CONCAT: '&';
PERCENT: '%';
POWER: '^';
BANG: '!';

DIGIT: '0'..'9';

INT_CONST: DIGIT+ ;
NUM_CONST: DIGIT* '.' DIGIT+ (('E'|'e') ('+'|'-')? DIGIT+)?; // \d*\.\d+(?:[Ee][+-]?\d+)?
STR_CONST: '"' ~'"' '"'; // TODO add escape recognition
REF2D: '$'? ('A'..'I')? ('A'..'Z') '$'? DIGIT+;
TRUE_CONST: ('T'|'t') ('R'|'r') ('U'|'u') ('E'|'e') ;
FALSE_CONST: ('F'|'f') ('A'|'a') ('L'|'l') ('S'|'s') ('E'|'e') ;
NAME: '\w[\.\w]*' ;
QUOTENAME: '\'(?:[^\']|\'\')*\'';
FUNC_IF: 'IF';
FUNC_CHOOSE: 'CHOOSE';
