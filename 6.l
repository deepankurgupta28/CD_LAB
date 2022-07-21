%{
#include"y.tab.h"
%}

%%
[a-z] {yylval=yytext[0];
      return val;
      }
.     return yytext[0];
"\n"  return 0;

%%
