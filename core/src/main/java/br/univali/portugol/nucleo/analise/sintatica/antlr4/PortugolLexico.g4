lexer grammar PortugolLexico;

ABRE_PARENTESES:            '(' ;
FECHA_PARENTESES:           ')' ;
ABRE_COLCHETES:             '[' ;
FECHA_COLCHETES:            ']' ;
ABRE_CHAVES:                '{' ;
FECHA_CHAVES:               '}' ; 
PARAMETRO_POR_REFERENCIA:   '&' ;

TIPO:           'real' | 'inteiro' | 'vazio' | 'logico' | 'cadeia' | 'caracter' ; 

FACA:           'faca' ;
ENQUANTO:       'enquanto' ;
PARA:           'para' ;
SE:             'se' ;
SENAO:          'senao' ;
CONSTANTE:          'const' ;
FUNCAO:         'funcao' ;
PROGRAMA:       'programa' ;
ESCOLHA:        'escolha' ;
CASO:           'caso' ;
CONTRARIO:      'contrario' ;
PARE:           'pare' ;
RETORNE:        'retorne';
OP_NAO:            'nao' ;
OP_E_LOGICO:       'e' ;
OP_OU_LOGICO:      'ou';
INCLUA:         'inclua' ;
BIBLIOTECA:     'biblioteca' ;
OP_SUBTRACAO:      '-' ;
OP_ADICAO:         '+' ;
OP_MULTIPLICACAO:  '*' ;
OP_DIVISAO:        '/' ;
OP_MOD:            '%' ;
OP_IGUALDADE:      '==' ;
OP_DIFERENCA:      '!=' ;
OP_MAIOR:          '>' ;
OP_MENOR:          '<' ;
OP_MENOR_IGUAL:    '<=' ;
OP_MAIOR_IGUAL:     '>=' ;
OP_INCREMENTO_UNARIO:   '++' ;
OP_DECREMENTO_UNARIO:   '--' ;

LOGICO: VERDADEIRO | FALSO ;

VERDADEIRO:    'verdadeiro' ;
FALSO:         'falso' ;

CARACTER:       '\'' ( SEQ_ESC | ~('\''|'\\') ) '\'' ;

fragment DIGIT_HEX: ('0'..'9'|'a'..'f'|'A'..'F') ;

//fragment SEQ_ESC:	'\\' ('b'|'t'|'n'|'f'|'r'|'\"'|'\''|'\\') | ESC_UNICODE | ESC_OCTAL ;
fragment SEQ_ESC:       '\\' ('b'|'t'|'n'|'f'|'r'|'\''|'\\') | ESC_UNICODE | ESC_OCTAL ;

fragment ESC_OCTAL:     '\\' ('0'..'3') ('0'..'7') ('0'..'7') | '\\' ('0'..'7') ('0'..'7') | '\\' ('0'..'7') ;

fragment ESC_UNICODE:   '\\' 'u' DIGIT_HEX DIGIT_HEX DIGIT_HEX DIGIT_HEX ;

STRING:         '"' ( SEQ_ESC | ~('\\'|'"') )* '"' ;
ID:             LETRA (LETRA | [0-9] | '_')* ;

fragment LETRA: [a-zA-Z] ;

REAL:   DIGITO+ '.' DIGITO* 
        | '.' DIGITO+          
        ;

fragment DIGITO: [0-9] ; 

INT:    DIGITO+ ;

COMENTARIO:         '/*' .*? '*/' -> channel(HIDDEN) ;
COMENTARIO_SIMPLES: '//' .*? '\n' -> channel(HIDDEN) ; // acho que o ideal seria mandar os comentários para outro canal como no livro no Antlr4

WS      : [ \t\n\r]+ -> skip ;
