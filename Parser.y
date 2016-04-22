/* Mini Calculator */
/* calc.y */

%{
#include <iostream>
using namespace std;
extern int yyerror(const char *s, ...);
extern int yylex(void);
extern int yylineno;
%}

%token LTE
%token LT
%token IF
%token GTE
%token GT
%token EE
%token NE
%token PLUS
%token MINUS
%token TIMES
%token DIVIDE
%token ID
%token VOID
%token FLOAT
%token INT
%token OPENSB
%token CLOSESB
%token OPENP
%token CLOSEP
%token OPENB
%token CLOSEB
%token DELIM
%token COMMA
%token EPSILON
%token NUM
%token ASSIGN
%token WHILE
%token ELSE


%start	program

%%

program:		/* empty */
		type_specifier ID OPENP params CLOSEP OPENB declaration_list compound_statement CLOSEB {cout"Successful!";}
		;
declaration_list:
    declaration | declaration
    ;

declaration:
    var_declaration
    ;
var_declaration:
    type_specifier ID DELIM | type_specifier ID OPENSB NUM CLOSESB DELIM
    ;
type_specifier:
    INT | VOID | FLOAT
    ;

params:
    param_list | VOID
    ;
param_list:
    param_list COMMA param | param
    ;
param:
		type_specifier ID | type_specifier ID OPENSB CLOSESB
    ;
compound_stmt:
	 OPENB statement_list CLOSEB
   ;
statement_list:
	  statement_list statement | EPSILON
    ;
statement:
    assignment_stmt | compound_stmt | selection_stmt | iteration_stmt
    ;
selection_stmt:
    IF OPENP expression CLOSEP statement | IF OPENP expression CLOSEP statement ELSE statement
    ;
iteration_stmt:
    WHILE OPENP expression CLOSEP statement
    ;
assignment_stmt:
    var ASSIGNOP expression;

var:
		ID | ID OPENSB expression CLOSESB
    ;
expression:
		expression relop additive_expression | additive_expression
    ;
relop:
		LTE | LT | GT | GTE | EE | NE
    ;
additive_expression:
	  additive_expression addop term | term
    ;
addop:
    PLUS | MINUS
    ;
term:
    term mulop factor | factor
    ;
mulop:
    TIMES | DIVIDE
    ;
factor:
    OPENP expression CLOSEP | var | NUM
    ;
%%
