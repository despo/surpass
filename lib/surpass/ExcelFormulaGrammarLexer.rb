#!/usr/bin/env ruby
#
# ExcelFormulaGrammar.g
# 
# Generated using ANTLR version: 3.2.1-SNAPSHOT Dec 18, 2009 04:29:28
# Ruby runtime library version: 1.3.1
# Input grammar file: ExcelFormulaGrammar.g
# Generated at: 2010-05-02 22:24:46
# 

# ~~~> start load path setup
this_directory = File.expand_path( File.dirname( __FILE__ ) )
$:.unshift( this_directory ) unless $:.include?( this_directory )

antlr_load_failed = proc do
  load_path = $LOAD_PATH.map { |dir| '  - ' << dir }.join( $/ )
  raise LoadError, <<-END.strip!
  
Failed to load the ANTLR3 runtime library (version 1.3.1):

Ensure the library has been installed on your system and is available
on the load path. If rubygems is available on your system, this can
be done with the command:
  
  gem install antlr3

Current load path:
#{ load_path }

  END
end

defined?(ANTLR3) or begin
  
  # 1: try to load the ruby antlr3 runtime library from the system path
  require 'antlr3'
  
rescue LoadError
  
  # 2: try to load rubygems if it isn't already loaded
  defined?(Gem) or begin
    require 'rubygems'
  rescue LoadError
    antlr_load_failed.call
  end
  
  # 3: try to activate the antlr3 gem
  begin
    Gem.activate( 'antlr3', '= 1.3.1' )
  rescue Gem::LoadError
    antlr_load_failed.call
  end
  
  require 'antlr3'
  
end
# <~~~ end load path setup


module ExcelFormulaGrammar
  # TokenData defines all of the token type integer values
  # as constants, which will be included in all 
  # ANTLR-generated recognizers.
  const_defined?(:TokenData) or TokenData = ANTLR3::TokenScheme.new

  module TokenData

    # define the token constants
    define_tokens(:GE => 8, :LT => 7, :NUM_CONST => 21, :PERCENT => 16, 
                  :REF2D => 22, :CONCAT => 10, :RP => 29, :LP => 26, :INT_CONST => 20, 
                  :STR_CONST => 19, :POWER => 15, :SUB => 12, :FUNC_CHOOSE => 30, 
                  :SEMICOLON => 27, :BANG => 24, :TRUE_CONST => 17, :EOF => -1, 
                  :MUL => 13, :COLON => 23, :FALSE_CONST => 18, :NAME => 31, 
                  :COMMA => 28, :GT => 6, :DIGIT => 33, :DIV => 14, :EQ => 4, 
                  :FUNC_IF => 25, :QUOTENAME => 32, :LE => 9, :ADD => 11, 
                  :NE => 5)
    
  end


  class Lexer < ANTLR3::Lexer
    @grammar_home = ExcelFormulaGrammar
    include TokenData

    begin
      generated_using( "ExcelFormulaGrammar.g", "3.2.1-SNAPSHOT Dec 18, 2009 04:29:28", "1.3.1" )
    rescue NoMethodError => error
      error.name.to_sym == :generated_using or raise
    end
    
    RULE_NAMES   = ["EQ", "LT", "GT", "NE", "LE", "GE", "ADD", "SUB", "MUL", 
                    "DIV", "COLON", "SEMICOLON", "COMMA", "LP", "RP", "CONCAT", 
                    "PERCENT", "POWER", "BANG", "DIGIT", "INT_CONST", "NUM_CONST", 
                    "STR_CONST", "REF2D", "TRUE_CONST", "FALSE_CONST", "NAME", 
                    "QUOTENAME", "FUNC_IF", "FUNC_CHOOSE"].freeze
    RULE_METHODS = [:eq!, :lt!, :gt!, :ne!, :le!, :ge!, :add!, :sub!, :mul!, 
                    :div!, :colon!, :semicolon!, :comma!, :lp!, :rp!, :concat!, 
                    :percent!, :power!, :bang!, :digit!, :int_const!, :num_const!, 
                    :str_const!, :ref_2_d!, :true_const!, :false_const!, 
                    :name!, :quotename!, :func_if!, :func_choose!].freeze

    
    def initialize(input=nil, options = {})
      super(input, options)

    end
    
    # - - - - - - - - - - - lexer rules - - - - - - - - - - - -
    # lexer rule eq! (EQ)
    # (in ExcelFormulaGrammar.g)
    def eq!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 1)

      type = EQ
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 329:5: '='
      match(?=)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 1)

    end

    # lexer rule lt! (LT)
    # (in ExcelFormulaGrammar.g)
    def lt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 2)

      type = LT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 330:5: '<'
      match(?<)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 2)

    end

    # lexer rule gt! (GT)
    # (in ExcelFormulaGrammar.g)
    def gt!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 3)

      type = GT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 331:5: '>'
      match(?>)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 3)

    end

    # lexer rule ne! (NE)
    # (in ExcelFormulaGrammar.g)
    def ne!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 4)

      type = NE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 332:5: '<>'
      match("<>")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 4)

    end

    # lexer rule le! (LE)
    # (in ExcelFormulaGrammar.g)
    def le!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 5)

      type = LE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 333:5: '<='
      match("<=")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 5)

    end

    # lexer rule ge! (GE)
    # (in ExcelFormulaGrammar.g)
    def ge!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 6)

      type = GE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 334:5: '>='
      match(">=")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 6)

    end

    # lexer rule add! (ADD)
    # (in ExcelFormulaGrammar.g)
    def add!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 7)

      type = ADD
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 336:6: '+'
      match(?+)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 7)

    end

    # lexer rule sub! (SUB)
    # (in ExcelFormulaGrammar.g)
    def sub!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 8)

      type = SUB
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 337:6: '-'
      match(?-)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 8)

    end

    # lexer rule mul! (MUL)
    # (in ExcelFormulaGrammar.g)
    def mul!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 9)

      type = MUL
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 338:6: '*'
      match(?*)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 9)

    end

    # lexer rule div! (DIV)
    # (in ExcelFormulaGrammar.g)
    def div!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 10)

      type = DIV
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 339:6: '/'
      match(?/)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 10)

    end

    # lexer rule colon! (COLON)
    # (in ExcelFormulaGrammar.g)
    def colon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 11)

      type = COLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 341:8: ':'
      match(?:)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 11)

    end

    # lexer rule semicolon! (SEMICOLON)
    # (in ExcelFormulaGrammar.g)
    def semicolon!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 12)

      type = SEMICOLON
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 342:12: ';'
      match(?;)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 12)

    end

    # lexer rule comma! (COMMA)
    # (in ExcelFormulaGrammar.g)
    def comma!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 13)

      type = COMMA
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 343:8: ','
      match(?,)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 13)

    end

    # lexer rule lp! (LP)
    # (in ExcelFormulaGrammar.g)
    def lp!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 14)

      type = LP
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 345:5: '('
      match(?()

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 14)

    end

    # lexer rule rp! (RP)
    # (in ExcelFormulaGrammar.g)
    def rp!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 15)

      type = RP
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 346:5: ')'
      match(?))

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 15)

    end

    # lexer rule concat! (CONCAT)
    # (in ExcelFormulaGrammar.g)
    def concat!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 16)

      type = CONCAT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 347:9: '&'
      match(?&)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 16)

    end

    # lexer rule percent! (PERCENT)
    # (in ExcelFormulaGrammar.g)
    def percent!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 17)

      type = PERCENT
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 348:10: '%'
      match(?%)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 17)

    end

    # lexer rule power! (POWER)
    # (in ExcelFormulaGrammar.g)
    def power!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 18)

      type = POWER
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 349:8: '^'
      match(?^)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 18)

    end

    # lexer rule bang! (BANG)
    # (in ExcelFormulaGrammar.g)
    def bang!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 19)

      type = BANG
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 350:7: '!'
      match(?!)

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 19)

    end

    # lexer rule digit! (DIGIT)
    # (in ExcelFormulaGrammar.g)
    def digit!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 20)

      
      # - - - - main rule block - - - -
      # at line 352:17: '0' .. '9'
      match_range(?0, ?9)

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 20)

    end

    # lexer rule int_const! (INT_CONST)
    # (in ExcelFormulaGrammar.g)
    def int_const!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 21)

      type = INT_CONST
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 354:12: ( DIGIT )+
      # at file 354:12: ( DIGIT )+
      match_count_1 = 0
      loop do
        alt_1 = 2
        look_1_0 = @input.peek(1)

        if (look_1_0.between?(?0, ?9)) 
          alt_1 = 1

        end
        case alt_1
        when 1
          # at line 354:12: DIGIT
          digit!

        else
          match_count_1 > 0 and break
          eee = EarlyExit(1)


          raise eee
        end
        match_count_1 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 21)

    end

    # lexer rule num_const! (NUM_CONST)
    # (in ExcelFormulaGrammar.g)
    def num_const!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 22)

      type = NUM_CONST
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 355:12: ( DIGIT )* '.' ( DIGIT )+ ( ( 'E' | 'e' ) ( '+' | '-' )? ( DIGIT )+ )?
      # at line 355:12: ( DIGIT )*
      loop do # decision 2
        alt_2 = 2
        look_2_0 = @input.peek(1)

        if (look_2_0.between?(?0, ?9)) 
          alt_2 = 1

        end
        case alt_2
        when 1
          # at line 355:12: DIGIT
          digit!

        else
          break # out of loop for decision 2
        end
      end # loop for decision 2
      match(?.)
      # at file 355:23: ( DIGIT )+
      match_count_3 = 0
      loop do
        alt_3 = 2
        look_3_0 = @input.peek(1)

        if (look_3_0.between?(?0, ?9)) 
          alt_3 = 1

        end
        case alt_3
        when 1
          # at line 355:23: DIGIT
          digit!

        else
          match_count_3 > 0 and break
          eee = EarlyExit(3)


          raise eee
        end
        match_count_3 += 1
      end

      # at line 355:30: ( ( 'E' | 'e' ) ( '+' | '-' )? ( DIGIT )+ )?
      alt_6 = 2
      look_6_0 = @input.peek(1)

      if (look_6_0 == ?E || look_6_0 == ?e) 
        alt_6 = 1
      end
      case alt_6
      when 1
        # at line 355:31: ( 'E' | 'e' ) ( '+' | '-' )? ( DIGIT )+
        if @input.peek(1) == ?E || @input.peek(1) == ?e
          @input.consume
        else
          mse = MismatchedSet(nil)
          recover(mse)
          raise mse
        end


        # at line 355:41: ( '+' | '-' )?
        alt_4 = 2
        look_4_0 = @input.peek(1)

        if (look_4_0 == ?+ || look_4_0 == ?-) 
          alt_4 = 1
        end
        case alt_4
        when 1
          # at line 
          if @input.peek(1) == ?+ || @input.peek(1) == ?-
            @input.consume
          else
            mse = MismatchedSet(nil)
            recover(mse)
            raise mse
          end



        end
        # at file 355:52: ( DIGIT )+
        match_count_5 = 0
        loop do
          alt_5 = 2
          look_5_0 = @input.peek(1)

          if (look_5_0.between?(?0, ?9)) 
            alt_5 = 1

          end
          case alt_5
          when 1
            # at line 355:52: DIGIT
            digit!

          else
            match_count_5 > 0 and break
            eee = EarlyExit(5)


            raise eee
          end
          match_count_5 += 1
        end


      end

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 22)

    end

    # lexer rule str_const! (STR_CONST)
    # (in ExcelFormulaGrammar.g)
    def str_const!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 23)

      type = STR_CONST
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 356:12: '\"' (~ '\"' )+ '\"'
      match(?")
      # at file 356:16: (~ '\"' )+
      match_count_7 = 0
      loop do
        alt_7 = 2
        look_7_0 = @input.peek(1)

        if (look_7_0.between?(0x0000, ?!) || look_7_0.between?(?#, 0xFFFF)) 
          alt_7 = 1

        end
        case alt_7
        when 1
          # at line 356:17: ~ '\"'
          if @input.peek(1).between?(0x0000, ?!) || @input.peek(1).between?(?#, 0x00FF)
            @input.consume
          else
            mse = MismatchedSet(nil)
            recover(mse)
            raise mse
          end



        else
          match_count_7 > 0 and break
          eee = EarlyExit(7)


          raise eee
        end
        match_count_7 += 1
      end

      match(?")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 23)

    end

    # lexer rule ref_2_d! (REF2D)
    # (in ExcelFormulaGrammar.g)
    def ref_2_d!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 24)

      type = REF2D
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 357:8: ( '$' )? ( 'A' .. 'I' )? ( 'A' .. 'Z' ) ( '$' )? ( DIGIT )+
      # at line 357:8: ( '$' )?
      alt_8 = 2
      look_8_0 = @input.peek(1)

      if (look_8_0 == ?$) 
        alt_8 = 1
      end
      case alt_8
      when 1
        # at line 357:8: '$'
        match(?$)

      end
      # at line 357:13: ( 'A' .. 'I' )?
      alt_9 = 2
      look_9_0 = @input.peek(1)

      if (look_9_0.between?(?A, ?I)) 
        look_9_1 = @input.peek(2)

        if (look_9_1.between?(?A, ?Z)) 
          alt_9 = 1
        end
      end
      case alt_9
      when 1
        # at line 357:14: 'A' .. 'I'
        match_range(?A, ?I)

      end
      # at line 357:25: ( 'A' .. 'Z' )
      # at line 357:26: 'A' .. 'Z'
      match_range(?A, ?Z)

      # at line 357:36: ( '$' )?
      alt_10 = 2
      look_10_0 = @input.peek(1)

      if (look_10_0 == ?$) 
        alt_10 = 1
      end
      case alt_10
      when 1
        # at line 357:36: '$'
        match(?$)

      end
      # at file 357:41: ( DIGIT )+
      match_count_11 = 0
      loop do
        alt_11 = 2
        look_11_0 = @input.peek(1)

        if (look_11_0.between?(?0, ?9)) 
          alt_11 = 1

        end
        case alt_11
        when 1
          # at line 357:41: DIGIT
          digit!

        else
          match_count_11 > 0 and break
          eee = EarlyExit(11)


          raise eee
        end
        match_count_11 += 1
      end


      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 24)

    end

    # lexer rule true_const! (TRUE_CONST)
    # (in ExcelFormulaGrammar.g)
    def true_const!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 25)

      type = TRUE_CONST
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 358:13: ( 'T' | 't' ) ( 'R' | 'r' ) ( 'U' | 'u' ) ( 'E' | 'e' )
      if @input.peek(1) == ?T || @input.peek(1) == ?t
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?R || @input.peek(1) == ?r
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?U || @input.peek(1) == ?u
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?E || @input.peek(1) == ?e
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end



      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 25)

    end

    # lexer rule false_const! (FALSE_CONST)
    # (in ExcelFormulaGrammar.g)
    def false_const!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 26)

      type = FALSE_CONST
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 359:14: ( 'F' | 'f' ) ( 'A' | 'a' ) ( 'L' | 'l' ) ( 'S' | 's' ) ( 'E' | 'e' )
      if @input.peek(1) == ?F || @input.peek(1) == ?f
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?A || @input.peek(1) == ?a
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?L || @input.peek(1) == ?l
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?S || @input.peek(1) == ?s
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end


      if @input.peek(1) == ?E || @input.peek(1) == ?e
        @input.consume
      else
        mse = MismatchedSet(nil)
        recover(mse)
        raise mse
      end



      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 26)

    end

    # lexer rule name! (NAME)
    # (in ExcelFormulaGrammar.g)
    def name!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 27)

      type = NAME
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 360:7: '\\w[\\.\\w]*'
      match("w[.w]*")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 27)

    end

    # lexer rule quotename! (QUOTENAME)
    # (in ExcelFormulaGrammar.g)
    def quotename!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 28)

      type = QUOTENAME
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 361:12: '\\'(?:[^\\']|\\'\\')*\\''
      match("'(?:[^']|'')*'")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 28)

    end

    # lexer rule func_if! (FUNC_IF)
    # (in ExcelFormulaGrammar.g)
    def func_if!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 29)

      type = FUNC_IF
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 362:10: 'IF'
      match("IF")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 29)

    end

    # lexer rule func_choose! (FUNC_CHOOSE)
    # (in ExcelFormulaGrammar.g)
    def func_choose!
      # -> uncomment the next line to manually enable rule tracing
      # trace_in(__method__, 30)

      type = FUNC_CHOOSE
      channel = ANTLR3::DEFAULT_CHANNEL

      
      # - - - - main rule block - - - -
      # at line 363:14: 'CHOOSE'
      match("CHOOSE")

      
      @state.type = type
      @state.channel = channel

    ensure
      # -> uncomment the next line to manually enable rule tracing
      # trace_out(__method__, 30)

    end

    # main rule used to study the input at the current position,
    # and choose the proper lexer rule to call in order to
    # fetch the next token
    # 
    # usually, you don't make direct calls to this method,
    # but instead use the next_token method, which will
    # build and emit the actual next token
    def token!
      # at line 1:8: ( EQ | LT | GT | NE | LE | GE | ADD | SUB | MUL | DIV | COLON | SEMICOLON | COMMA | LP | RP | CONCAT | PERCENT | POWER | BANG | INT_CONST | NUM_CONST | STR_CONST | REF2D | TRUE_CONST | FALSE_CONST | NAME | QUOTENAME | FUNC_IF | FUNC_CHOOSE )
      alt_12 = 29
      alt_12 = @dfa12.predict(@input)
      case alt_12
      when 1
        # at line 1:10: EQ
        eq!

      when 2
        # at line 1:13: LT
        lt!

      when 3
        # at line 1:16: GT
        gt!

      when 4
        # at line 1:19: NE
        ne!

      when 5
        # at line 1:22: LE
        le!

      when 6
        # at line 1:25: GE
        ge!

      when 7
        # at line 1:28: ADD
        add!

      when 8
        # at line 1:32: SUB
        sub!

      when 9
        # at line 1:36: MUL
        mul!

      when 10
        # at line 1:40: DIV
        div!

      when 11
        # at line 1:44: COLON
        colon!

      when 12
        # at line 1:50: SEMICOLON
        semicolon!

      when 13
        # at line 1:60: COMMA
        comma!

      when 14
        # at line 1:66: LP
        lp!

      when 15
        # at line 1:69: RP
        rp!

      when 16
        # at line 1:72: CONCAT
        concat!

      when 17
        # at line 1:79: PERCENT
        percent!

      when 18
        # at line 1:87: POWER
        power!

      when 19
        # at line 1:93: BANG
        bang!

      when 20
        # at line 1:98: INT_CONST
        int_const!

      when 21
        # at line 1:108: NUM_CONST
        num_const!

      when 22
        # at line 1:118: STR_CONST
        str_const!

      when 23
        # at line 1:128: REF2D
        ref_2_d!

      when 24
        # at line 1:134: TRUE_CONST
        true_const!

      when 25
        # at line 1:145: FALSE_CONST
        false_const!

      when 26
        # at line 1:157: NAME
        name!

      when 27
        # at line 1:162: QUOTENAME
        quotename!

      when 28
        # at line 1:172: FUNC_IF
        func_if!

      when 29
        # at line 1:180: FUNC_CHOOSE
        func_choose!

      end
    end

    
    # - - - - - - - - - - DFA definitions - - - - - - - - - - -
    class DFA12 < ANTLR3::DFA
      EOT = unpack(2, -1, 1, 31, 1, 33, 13, -1, 1, 34, 18, -1, 1, 38, 3, 
                   -1)
      EOF = unpack(40, -1)
      MIN = unpack(1, 0, 1, -1, 2, 61, 13, -1, 1, 46, 3, -1, 2, 36, 1, -1, 
                   1, 36, 3, -1, 1, 36, 6, -1, 3, 36, 2, -1)
      MAX = unpack(1, 116, 1, -1, 1, 62, 1, 61, 13, -1, 1, 57, 3, -1, 1, 
                   97, 1, 114, 1, -1, 1, 90, 3, -1, 1, 90, 6, -1, 1, 108, 
                   1, 57, 1, 79, 2, -1)
      ACCEPT = unpack(1, -1, 1, 1, 2, -1, 1, 7, 1, 8, 1, 9, 1, 10, 1, 11, 
                      1, 12, 1, 13, 1, 14, 1, 15, 1, 16, 1, 17, 1, 18, 1, 
                      19, 1, -1, 1, 21, 1, 22, 1, 23, 2, -1, 1, 24, 1, -1, 
                      1, 25, 1, 26, 1, 27, 1, -1, 1, 4, 1, 5, 1, 2, 1, 6, 
                      1, 3, 1, 20, 3, -1, 1, 28, 1, 29)
      SPECIAL = unpack(40, -1)
      TRANSITION = [
        unpack(1, 26, 32, -1, 1, 16, 1, 19, 1, -1, 1, 20, 1, 14, 1, 13, 
               1, 27, 1, 11, 1, 12, 1, 6, 1, 4, 1, 10, 1, 5, 1, 18, 1, 7, 
               10, 17, 1, 8, 1, 9, 1, 2, 1, 1, 1, 3, 2, -1, 2, 20, 1, 28, 
               2, 20, 1, 21, 2, 20, 1, 24, 10, 20, 1, 22, 6, 20, 3, -1, 
               1, 15, 7, -1, 1, 25, 13, -1, 1, 23),
        unpack(),
        unpack(1, 30, 1, 29),
        unpack(1, 32),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(1, 18, 1, -1, 10, 17),
        unpack(),
        unpack(),
        unpack(),
        unpack(1, 20, 11, -1, 10, 20, 7, -1, 1, 35, 25, 20, 6, -1, 1, 25),
        unpack(1, 20, 11, -1, 10, 20, 24, -1, 1, 23, 31, -1, 1, 23),
        unpack(),
        unpack(1, 20, 11, -1, 10, 20, 7, -1, 5, 20, 1, 36, 20, 20),
        unpack(),
        unpack(),
        unpack(),
        unpack(1, 20, 11, -1, 10, 20, 7, -1, 7, 20, 1, 37, 18, 20),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(),
        unpack(1, 20, 11, -1, 10, 20, 18, -1, 1, 25, 31, -1, 1, 25),
        unpack(1, 20, 11, -1, 10, 20),
        unpack(1, 20, 11, -1, 10, 20, 21, -1, 1, 39),
        unpack(),
        unpack()
      ].freeze
      
      ( 0 ... MIN.length ).zip( MIN, MAX ) do | i, a, z |
        if a > 0 and z < 0
          MAX[ i ] %= 0x10000
        end
      end
      
      @decision = 12
      

      def description
        <<-'__dfa_description__'.strip!
          1:1: Tokens : ( EQ | LT | GT | NE | LE | GE | ADD | SUB | MUL | DIV | COLON | SEMICOLON | COMMA | LP | RP | CONCAT | PERCENT | POWER | BANG | INT_CONST | NUM_CONST | STR_CONST | REF2D | TRUE_CONST | FALSE_CONST | NAME | QUOTENAME | FUNC_IF | FUNC_CHOOSE );
        __dfa_description__
      end
    end

    
    private
    
    def initialize_dfas
      super rescue nil
      @dfa12 = DFA12.new(self, 12)

    end
  end # class Lexer < ANTLR3::Lexer

  at_exit { Lexer.main(ARGV) } if __FILE__ == $0
end

