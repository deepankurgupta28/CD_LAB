%{
#include "y.tab.h";
extern yylval;
%}

ALPHA [A-Za-z_]
DIGIT [0-9]
%%

{ALPHA}({ALPHA}|{DIGIT})* return ID;
{DIGIT}+ {yylval=atoi(yytext); return NUM;}
[\n\t] yyterminate();
. return yytext[0];
%%
int yywrap(){return 1;}