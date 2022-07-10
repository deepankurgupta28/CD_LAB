%{
#include "y.tab.h"
extern int yylval;
%}
%%
"for" {return 'f';}
"{" {return '{';}
"}" {return '}';}
"(" {return '(';}
")" {return ')';}
";" {return ';';}
"=" {return '=';}
"+" {return '+';}
"-" {return '-';}
"<" {return '<';}
">" {return '>';}
~ return 0;
"\n" {return 'n';}
[a-zA-Z]+ {yylval=yytext; return ID;}
[0-9]+ {yylval= yytext; return NUM;}
%%