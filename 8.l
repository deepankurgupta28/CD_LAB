%{
#include "y.tab.h"
extern yylval;
%}
%%
[a-z] {yylval = yytext[0];return letter;}
. return yytext[0];
\n return 0;
%%
