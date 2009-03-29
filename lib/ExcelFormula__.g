lexer grammar ExcelFormula;
options {
  language=Ruby;

}

// $ANTLR src "lib/ExcelFormula.g" 332
fragment
EQ: '=';
// $ANTLR src "lib/ExcelFormula.g" 334
LT: '<';
// $ANTLR src "lib/ExcelFormula.g" 335
GT: '>';
// $ANTLR src "lib/ExcelFormula.g" 336
NE: '<>';
// $ANTLR src "lib/ExcelFormula.g" 337
LE: '<=';
// $ANTLR src "lib/ExcelFormula.g" 338
GE: '>=';

// $ANTLR src "lib/ExcelFormula.g" 340
ADD: '+';
// $ANTLR src "lib/ExcelFormula.g" 341
SUB: '-';
// $ANTLR src "lib/ExcelFormula.g" 342
MUL: '*';
// $ANTLR src "lib/ExcelFormula.g" 343
DIV: '/';

// $ANTLR src "lib/ExcelFormula.g" 345
COLON: ':';
// $ANTLR src "lib/ExcelFormula.g" 346
SEMICOLON: ';';
// $ANTLR src "lib/ExcelFormula.g" 347
COMMA: ',';

// $ANTLR src "lib/ExcelFormula.g" 349
LP: '(';
// $ANTLR src "lib/ExcelFormula.g" 350
RP: ')';
// $ANTLR src "lib/ExcelFormula.g" 351
CONCAT: '&';
// $ANTLR src "lib/ExcelFormula.g" 352
PERCENT: '%';
// $ANTLR src "lib/ExcelFormula.g" 353
POWER: '^';
// $ANTLR src "lib/ExcelFormula.g" 354
BANG: '!';

// $ANTLR src "lib/ExcelFormula.g" 356
DIGIT: '0'..'9';

// $ANTLR src "lib/ExcelFormula.g" 358
INT_CONST: DIGIT+ ;
// $ANTLR src "lib/ExcelFormula.g" 359
NUM_CONST: DIGIT* '.' DIGIT+ (('E'|'e') ('+'|'-')? DIGIT+)?; // \d*\.\d+(?:[Ee][+-]?\d+)?
// $ANTLR src "lib/ExcelFormula.g" 360
STR_CONST: '"' ~'"' '"'; // TODO add escape recognition
// $ANTLR src "lib/ExcelFormula.g" 361
REF2D: '$'? ('A'..'I')? ('A'..'Z') '$'? DIGIT+;
// $ANTLR src "lib/ExcelFormula.g" 362
TRUE_CONST: ('T'|'t') ('R'|'r') ('U'|'u') ('E'|'e') ;
// $ANTLR src "lib/ExcelFormula.g" 363
FALSE_CONST: ('F'|'f') ('A'|'a') ('L'|'l') ('S'|'s') ('E'|'e') ;
// $ANTLR src "lib/ExcelFormula.g" 364
NAME: '\w[\.\w]*' ;
// $ANTLR src "lib/ExcelFormula.g" 365
QUOTENAME: '\'(?:[^\']|\'\')*\'';
// $ANTLR src "lib/ExcelFormula.g" 366
FUNC_IF: 'IF';
// $ANTLR src "lib/ExcelFormula.g" 367
FUNC_CHOOSE: 'CHOOSE';
