%{
#include <stdio.h>
%}

DIGIT   [0-9]
LETTER  [a-zA-Z]
ID      {LETTER}({LETTER}|{DIGIT})*
INT     {DIGIT}+

%%

/* Keywords */
"ingredient"    { printf("INGREDIENT\n"); }
"recipe"        { printf("RECIPE\n"); }
"serve"         { printf("SERVE\n"); }
"heat"          { printf("IF\n"); }
"stir"          { printf("WHILE\n"); }

/* Types */
"amount"        { printf("TYPE_INT\n"); }

/* Operators */
"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULT\n"); }
"/"             { printf("DIV\n"); }
"="             { printf("ASSIGN\n"); }

/* Symbols */
";"             { printf("SEMICOLON\n"); }
"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
"{"             { printf("LBRACE\n"); }
"}"             { printf("RBRACE\n"); }

/* Numbers */
{INT}           { printf("NUMBER(%s)\n", yytext); }

/* Identifier */
{ID}            { printf("IDENTIFIER(%s)\n", yytext); }

/* Ignore whitespace */
[ \t\n]+        ;

/* Unknown */
.               { printf("UNKNOWN(%s)\n", yytext); }

%%

int main() {
    yylex();
    return 0;
}

int yywrap() {
    return 1;
}