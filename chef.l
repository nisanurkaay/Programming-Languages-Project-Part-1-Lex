%{
/*
 * CHEF Language - Lexical Analyzer
 * A cooking-themed programming language
 */
#include <stdio.h>
#include <string.h>

int line_num = 1;
%}

/* Definitions */
DIGIT       [0-9]
LETTER      [a-zA-Z]
ID          {LETTER}({LETTER}|{DIGIT}|_)*
INT         {DIGIT}+
FLOAT       {DIGIT}+"."{DIGIT}+
STRING      \"[^\"]*\"
CHAR        \'[^\']\'
WHITESPACE  [ \t\r]+

%%

 /* ── KEYWORDS ── */

"ingredient"    { printf("INGREDIENT\n"); }
"secret"        { printf("SECRET\n"); }
"recipe"        { printf("RECIPE\n"); }
"serve"         { printf("SERVE\n"); }
"taste"         { printf("TASTE\n"); }
"heat"          { printf("HEAT\n"); }
"reheat"        { printf("REHEAT\n"); }
"burn"          { printf("BURN\n"); }
"stir"          { printf("STIR\n"); }

 /* ── TYPES ── */

"amount"        { printf("TYPE_AMOUNT\n"); }
"measure"       { printf("TYPE_MEASURE\n"); }
"flavor"        { printf("TYPE_FLAVOR\n"); }
"label"         { printf("TYPE_LABEL\n"); }
"piece"         { printf("TYPE_PIECE\n"); }

 /* ── BOOLEAN VALUES ── */

"fresh"         { printf("BOOL_TRUE\n"); }
"stale"         { printf("BOOL_FALSE\n"); }

 /* ── OPERATORS ── */

"+"             { printf("PLUS\n"); }
"-"             { printf("MINUS\n"); }
"*"             { printf("MULTIPLY\n"); }
"/"             { printf("DIVIDE\n"); }

 /* ── COMPARISON ── */

"=="            { printf("EQUAL\n"); }
"!="            { printf("NOT_EQUAL\n"); }
"<="            { printf("LESS_EQUAL\n"); }
">="            { printf("GREATER_EQUAL\n"); }
"<"             { printf("LESS\n"); }
">"             { printf("GREATER\n"); }

 /* ── LOGICAL ── */

"&&"            { printf("AND\n"); }
"||"            { printf("OR\n"); }
"!"             { printf("NOT\n"); }

 /* ── ASSIGNMENT ── */

"="             { printf("ASSIGN\n"); }

 /* ── PUNCTUATION ── */

";"             { printf("SEMICOLON\n"); }
","             { printf("COMMA\n"); }
"("             { printf("LPAREN\n"); }
")"             { printf("RPAREN\n"); }
"{"             { printf("LBRACE\n"); }
"}"             { printf("RBRACE\n"); }

 /* ── LITERALS ── */

{FLOAT}         { printf("FLOAT_LITERAL(%s)\n", yytext); }
{INT}           { printf("INT_LITERAL(%s)\n", yytext); }
{STRING}        { printf("STRING_LITERAL(%s)\n", yytext); }
{CHAR}          { printf("CHAR_LITERAL(%s)\n", yytext); }

 /* ── IDENTIFIER ── */

{ID}            { printf("ID(%s)\n", yytext); }

 /* ── COMMENTS ── */

"//"[^\n]*      { printf("COMMENT\n"); }
"/*"([^*]|\*+[^*/])*\*+"/"  { 
    /* count newlines inside block comments */
    for(int i = 0; i < yyleng; i++)
        if(yytext[i] == '\n') line_num++;
    printf("BLOCK_COMMENT\n"); 
}

 /* ── NEWLINE ── */

\n              { line_num++; }

 /* ── WHITESPACE ── */

{WHITESPACE}    { /* ignore */ }

 /* ── UNKNOWN ── */

.               { printf("UNKNOWN(%s) at line %d\n", yytext, line_num); }

%%

int yywrap() {
    return 1;
}

int main(int argc, char *argv[]) {
    if (argc > 1) {
        yyin = fopen(argv[1], "r");
        if (!yyin) {
            fprintf(stderr, "Error: Cannot open file '%s'\n", argv[1]);
            return 1;
        }
    } else {
        printf("CHEF Lexer - Reading from stdin (Ctrl+D to end)\n");
        printf("─────────────────────────────────────────────\n");
        yyin = stdin;
    }

    printf("─────────────────────────────────────────────\n");
    printf("TOKEN OUTPUT:\n");
    printf("─────────────────────────────────────────────\n");
    yylex();
    printf("─────────────────────────────────────────────\n");
    printf("Total lines processed: %d\n", line_num);

    if (argc > 1) fclose(yyin);
    return 0;
}
