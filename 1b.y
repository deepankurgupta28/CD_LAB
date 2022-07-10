%{
#include<stdio.h>
#include<stdlib.h>
%}
%%
S : A B;
A : 'a' A 'b'
|
;
B : 'b' B 'c'
|
;
%%
int yyerror()
{
printf("Error");
exit(0);
}
int main()
{
yyparse();
printf("Successfully parsed\n");
}