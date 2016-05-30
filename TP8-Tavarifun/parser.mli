type token =
  | AND
  | BOOL
  | COLON
  | COMP of (Ast.binop)
  | CONST_BOOL of (bool)
  | CONST_INT of (int)
  | CONST_UNIT
  | DOUBLE_EQUAL
  | ELSE
  | EOF
  | EOI
  | EQUAL
  | IDENT of (string)
  | IF
  | IN
  | INT
  | LET
  | LPAREN
  | MINUS
  | NEQ
  | NOT
  | OR
  | PLUS
  | PRINT_INT
  | PRINT_NEWLINE
  | REC
  | RPAREN
  | SEMI
  | SLASH
  | STAR
  | THEN
  | UNIT
  | REF
  | GET_REF
  | SET_REF
  | NONE
  | SOME
  | OPTION
  | TYPE
  | MUTABLE
  | LBRACE
  | RBRACE
  | DOT
  | LT_MINUS

val prog :
  (Lexing.lexbuf  -> token) -> Lexing.lexbuf -> Ast.prog
