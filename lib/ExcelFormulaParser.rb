# ExcelFormulaParser (ExcelFormula.g)
# Generated by ANTLR 3.1.2-2008-10-21 on 2009-06-15 23:03:59

require 'ExcelFormulaLexer' unless defined?(ExcelFormulaLexer)

class ExcelFormulaParser
	attr_reader :lexer
	
    TOKENS = [
        ["EQ", 1],
        ["CONCAT", 2],
        ["ADD", 3],
        ["SUB", 4],
        ["MUL", 5],
        ["DIV", 6],
        ["POWER", 7],
        ["PERCENT", 8],
        ["TRUE_CONST", 9],
        ["FALSE_CONST", 10],
        ["STR_CONST", 11],
        ["INT_CONST", 12],
        ["NUM_CONST", 13],
        ["REF2D", 14],
        ["COLON", 15],
        ["LT", 16],
        ["GT", 17],
        ["NE", 18],
        ["LE", 19],
        ["GE", 20],
        ["SEMICOLON", 21],
        ["COMMA", 22],
        ["LP", 23],
        ["RP", 24],
        ["BANG", 25],
        ["DIGIT", 26],
        ["NAME", 27],
        ["QUOTENAME", 28],
        ["FUNC_IF", 29],
        ["FUNC_CHOOSE", 30]
    ].inject({}) { |hash, pair|
        name = pair[0]
        index = pair[1] + 3 # hardcoded for now... no way to get this value from ANTLR

        if name[0] == ?'
            hash[:"T__#{index}"] = index
        else
            hash[:"#{name}"] = index
        end

        hash
    }
    
    TOKENS[:EOF] = -1

    def initialize(input)
        if input.respond_to?(:to_str) || input.respond_to?(:read)
            input = ExcelFormulaLexer.new(input)
        end

		@lexer = input
        @input = TokenStream.new(input)
        @backtracking = 0
        @failed = false


          @rpn = ''
          @sheet_references = []
          @xcall_references = []


    end

    # 22:1: formula : expr[\"V\"] ;
    def formula()



        # 23:7: expr[\"V\"]
        expr("V")




    end

    # 26:1: expr[arg_type] : prec0_expr[arg_type] ( ( EQ ) prec0_expr[arg_type] )* ;
    def expr(arg_type)



        # 27:7: prec0_expr[arg_type] ( ( EQ ) prec0_expr[arg_type] )*
        prec0_expr(arg_type)

        # 28:9: ( ( EQ ) prec0_expr[arg_type] )*
        while true
            alt1 = 2
            # 
            look_ahead1_0 = look_ahead(1)
            if look_ahead1_0 == :EQ  
                alt1 = 1
            end
            case alt1
                when 1
                    # 29:13: ( EQ ) prec0_expr[arg_type]
                    # 30:19: EQ
                    match(:EQ)
                     op = [PTGEQ].pack('C') 
                    prec0_expr(arg_type)

                     @rpn += op 
                else
                    break
            end
        end



    end

    # 42:1: prec0_expr[arg_type] : prec1_expr[arg_type] ( ( CONCAT ) prec1_expr[arg_type] )* ;
    def prec0_expr(arg_type)



        # 43:7: prec1_expr[arg_type] ( ( CONCAT ) prec1_expr[arg_type] )*
        prec1_expr(arg_type)

        # 44:9: ( ( CONCAT ) prec1_expr[arg_type] )*
        while true
            alt2 = 2
            # 
            look_ahead2_0 = look_ahead(1)
            if look_ahead2_0 == :CONCAT  
                alt2 = 1
            end
            case alt2
                when 1
                    # 45:13: ( CONCAT ) prec1_expr[arg_type]
                    # 46:17: CONCAT
                    match(:CONCAT)
                     op = [PTGCONCAT].pack('C') 
                    prec1_expr(arg_type)

                     @rpn += op 
                else
                    break
            end
        end



    end

    # 52:1: prec1_expr[arg_type] : prec2_expr[arg_type] ( ( ADD | SUB ) prec2_expr[arg_type] )* ;
    def prec1_expr(arg_type)



        # 53:7: prec2_expr[arg_type] ( ( ADD | SUB ) prec2_expr[arg_type] )*
        prec2_expr(arg_type)

        # 54:9: ( ( ADD | SUB ) prec2_expr[arg_type] )*
        while true
            alt4 = 2
            # 
            look_ahead4_0 = look_ahead(1)
            if (TOKENS[look_ahead4_0] >= 6 && TOKENS[look_ahead4_0] <= 7)  
                alt4 = 1
            end
            case alt4
                when 1
                    # 55:13: ( ADD | SUB ) prec2_expr[arg_type]
                    # 55:13: ( ADD | SUB )
                    alt3 = 2
                    # 
                    look_ahead3_0 = look_ahead(1)
                    if look_ahead3_0 == :ADD  
                        alt3 = 1
                    elsif look_ahead3_0 == :SUB  
                        alt3 = 2
                    else
                        raise "Expected: "
                    end
                    case alt3
                        when 1
                            # 56:19: ADD
                            match(:ADD)
                             op = [PTGADD].pack('C') 
                        when 2
                            # 57:19: SUB
                            match(:SUB)
                             op = [PTGSUB].pack('C') 
                    end
                    prec2_expr(arg_type)

                     @rpn += op 
                else
                    break
            end
        end



    end

    # 64:1: prec2_expr[arg_type] : prec3_expr[arg_type] ( ( MUL | DIV ) prec3_expr[arg_type] )* ;
    def prec2_expr(arg_type)



        # 65:7: prec3_expr[arg_type] ( ( MUL | DIV ) prec3_expr[arg_type] )*
        prec3_expr(arg_type)

        # 66:9: ( ( MUL | DIV ) prec3_expr[arg_type] )*
        while true
            alt6 = 2
            # 
            look_ahead6_0 = look_ahead(1)
            if (TOKENS[look_ahead6_0] >= 8 && TOKENS[look_ahead6_0] <= 9)  
                alt6 = 1
            end
            case alt6
                when 1
                    # 67:13: ( MUL | DIV ) prec3_expr[arg_type]
                    # 67:13: ( MUL | DIV )
                    alt5 = 2
                    # 
                    look_ahead5_0 = look_ahead(1)
                    if look_ahead5_0 == :MUL  
                        alt5 = 1
                    elsif look_ahead5_0 == :DIV  
                        alt5 = 2
                    else
                        raise "Expected: "
                    end
                    case alt5
                        when 1
                            # 68:19: MUL
                            match(:MUL)
                             op = [PTGMUL].pack('C') 
                        when 2
                            # 69:19: DIV
                            match(:DIV)
                             op = [PTGDIV].pack('C') 
                    end
                    prec3_expr(arg_type)

                     @rpn += op 
                else
                    break
            end
        end



    end

    # 75:1: prec3_expr[arg_type] : prec5_expr[arg_type] ( ( POWER ) prec5_expr[arg_type] )* ;
    def prec3_expr(arg_type)



        # 76:7: prec5_expr[arg_type] ( ( POWER ) prec5_expr[arg_type] )*
        prec5_expr(arg_type)

        # 77:9: ( ( POWER ) prec5_expr[arg_type] )*
        while true
            alt7 = 2
            # 
            look_ahead7_0 = look_ahead(1)
            if look_ahead7_0 == :POWER  
                alt7 = 1
            end
            case alt7
                when 1
                    # 78:13: ( POWER ) prec5_expr[arg_type]
                    # 79:17: POWER
                    match(:POWER)
                     op = [PTGPOWER].pack('C') 
                    prec5_expr(arg_type)

                     @rpn += op 
                else
                    break
            end
        end



    end

    # 85:1: prec4_expr[arg_type] : prec5_expr[arg_type] ( PERCENT )? ;
    def prec4_expr(arg_type)



        # 86:7: prec5_expr[arg_type] ( PERCENT )?
        prec5_expr(arg_type)

        # 87:9: ( PERCENT )?
        alt8 = 2
        # 
        look_ahead8_0 = look_ahead(1)

        if look_ahead8_0 == :PERCENT  
            alt8 = 1
        end
        case alt8
            when 1
                # 88:13: PERCENT
                match(:PERCENT)
                 @rpn += [PTGPERCENT].pack('C') 
        end



    end

    # 92:1: prec5_expr[arg_type] : ( primary[arg_type] | SUB primary[arg_type] );
    def prec5_expr(arg_type)



        # 93:5: ( primary[arg_type] | SUB primary[arg_type] )
        alt9 = 2
        # 
        look_ahead9_0 = look_ahead(1)
        if (TOKENS[look_ahead9_0] >= 12 && TOKENS[look_ahead9_0] <= 17)  
            alt9 = 1
        elsif look_ahead9_0 == :SUB  
            alt9 = 2
        else
            raise "Expected: "
        end
        case alt9
            when 1
                # 93:7: primary[arg_type]
                primary(arg_type)

            when 2
                # 94:7: SUB primary[arg_type]
                match(:SUB)
                primary(arg_type)

                 @rpn += [PTGUMINUS].pack('C') 
        end



    end

    # 97:1: primary[arg_type] : ( TRUE_CONST | FALSE_CONST | str_tok= STR_CONST | int_tok= INT_CONST | num_tok= NUM_CONST | ref2d_tok= REF2D | ref2d1_tok= REF2D COLON ref2d2_tok= REF2D );
    def primary(arg_type)
    	_str_tok = nil
    	_int_tok = nil
    	_num_tok = nil
    	_ref2d_tok = nil
    	_ref2d1_tok = nil
    	_ref2d2_tok = nil




        # 98:5: ( TRUE_CONST | FALSE_CONST | str_tok= STR_CONST | int_tok= INT_CONST | num_tok= NUM_CONST | ref2d_tok= REF2D | ref2d1_tok= REF2D COLON ref2d2_tok= REF2D )
        alt10 = 7
        alt10 = DFA10.predict(self, @input)
        case alt10
            when 1
                # 98:7: TRUE_CONST
                match(:TRUE_CONST)

                            @rpn += [PTGBOOL, 1].pack("C2")
                        
            when 2
                # 102:7: FALSE_CONST
                match(:FALSE_CONST)

                            @rpn += [PTGBOOL, 0].pack("C2")
                        
            when 3
                # 106:7: str_tok= STR_CONST
                _str_tok = @input.look_ahead(1)
                match(:STR_CONST)

                            @rpn += [PTGSTR].pack('C') + upack1(str_tok.text[1, -1]) #TODO
                        
            when 4
                # 110:7: int_tok= INT_CONST
                _int_tok = @input.look_ahead(1)
                match(:INT_CONST)

                        int_value = int_tok.text.to_i
                        if int_value <= 65535
                            @rpn += [PTGINT, int_value].pack("Cv")
                        else
                            @rpn += [PTGNUM, int_value.to_f].pack("CE")
                        end
                    
            when 5
                # 119:7: num_tok= NUM_CONST
                _num_tok = @input.look_ahead(1)
                match(:NUM_CONST)

                            @rpn += [ptgNum, num_tok.text.to_f].pack("CE")
                        
            when 6
                # 123:7: ref2d_tok= REF2D
                _ref2d_tok = @input.look_ahead(1)
                match(:REF2D)

                          r, c = Utils.cell_to_packed_rowcol(ref2d_tok.text) # TODO
                          ptg = PTGREFR + RVA_DELTA[arg_type]
                          @rpn += [ptg, r, c].pack("Cv2")
                        
            when 7
                # 129:7: ref2d1_tok= REF2D COLON ref2d2_tok= REF2D
                _ref2d1_tok = @input.look_ahead(1)
                match(:REF2D)
                match(:COLON)
                _ref2d2_tok = @input.look_ahead(1)
                match(:REF2D)

                            r1, c1 = Utils.cell_to_packed_rowcol(ref2d1_tok.text) #TODO
                            r2, c2 = Utils.cell_to_packed_rowcol(ref2d2_tok.text) #TODO
                            ptg = PTGAREAR + RVA_DELTA[arg_type]
                            self.rpn += struct.pack("Cv4", ptg, r1, r2, c1, c2)
                        
        end



    end


      attr_accessor :rpn


    private

    class TokenStream
        attr_reader :index

        def initialize(input)
            @buffer = []
            @input = input
            @channel = nil

            @index = 0;
        end

        # returns a Token
        def look_ahead(pos)
            offset = @index + pos - 1

            while @buffer[-1] != :EOF && @buffer.length < offset + 1
                token = @input.next_token
                if token == :EOF || token.channel == @channel
                    @buffer << token
                end
            end

            offset = -1 if offset >= @buffer.length
            if offset < @buffer.length
                @buffer[offset]
            end
        end

        def mark
            @state = { :index => @index }
            return 0
        end

        def rewind(marker)
            @index = @state[:index]
        end

        def consume
           look_ahead(1) # force a read from the input if necessary
           @index = @index + 1
        end
    end

    def match(token = nil)
        if token.nil? || look_ahead(1) == token
            @input.consume
            @failed = false
            return
        elsif @backtracking > 0
            @failed = true
        else
            raise "Expected #{token}"
        end
    end

    def look_ahead(k)
        token = @input.look_ahead(k)
        if token != :EOF
            token = token.token_type
        end

        token
    end


	    class DFA
	        def initialize(eot, eof, min, max, accept, special, transition)
	            @eot = eot
	            @eof = eof
	            @min = min
	            @max = max
	            @accept = accept
	            @special = special
	            @transition = transition
	        end

	        def predict(parser, input)
	            mark = input.mark()
	            s = 0 # we always start at s0
	            begin
	                loop do
	                    special_state = @special[s]
	                    if special_state >= 0
	                        s = parser.special_state_transition(special_state)
	                        input.consume()
	                        next
	                    end

	                    if @accept[s] >= 1
	                        return @accept[s]
	                    end

	                    # look for a normal char transition
	                    c = input.look_ahead(1).to_i
	                    if c != :EOF && c >= @min[s] && c <= @max[s]
	                        next_state = @transition[s][c - @min[s]] # move to next state
	                        if next_state < 0
	                            # was in range but not a normal transition
	                            # must check EOT, which is like the else clause.
	                            # eot[s]>=0 indicates that an EOT edge goes to another
	                            # state.
	                            if @eot[s] >= 0  # EOT Transition to accept state?
	                                s = @eot[s]
	                                input.consume()
	                                next
	                            end
	                            raise "No viable alt"
	                        end
	                        s = next_state
	                        input.consume()
	                        next
	                    end
	                    if @eot[s] >= 0   # EOT Transition?
	                        s = @eot[s]
	                        input.consume()
	                        next
	                    end
	                    if c == :EOF && @eof[s] >= 0   # EOF Transition to accept state?
	                        return @accept[@eof[s]]
	                    end

	                    # not in range and not EOF/EOT, must be invalid symbol
	                    raise "No viable alt"
	                end
	            ensure
	                input.rewind(mark)
	            end
	        end
	    end

    DFA10 = DFA.new(
        [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
        [-1,-1,-1,-1,-1,-1,8,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
        [12,0,0,0,0,0,4,0,0,0,0,0,0,0,0,0,0],
        [17,0,0,0,0,0,18,0,0,0,0,0,0,0,0,0,0],
        [-1,1,2,3,4,5,-1,7,6,-1,-1,-1,-1,-1,-1,-1,-1],
        [-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1],
        [
            [1,2,3,4,5,6],
            [],
            [],
            [],
            [],
            [],
            [8,8,8,8,8,8,8,8,-1,-1,-1,-1,-1,-1,7],
            [],
            [],
            [],
            [],
            [],
            [],
            [],
            [],
            [],
            []
        ])

    def special_state_transition(s)
    		-1
    end

    public :special_state_transition
end