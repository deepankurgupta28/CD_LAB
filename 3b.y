%{
#include<stdio.h>
#include<stdlib.h>
int temp=0;
%}

%token NUM
%token ID
%left '='
%left '+''-'
%left '*''/'
%left '<''>'

%%
S:F {if(temp>=3){printf("success");exit(0);}
else{printf("failure");exit(0);};}
;
F:'f''('E';'E';'E')''{'X F'}' {temp+=1;}
|
;
X:E';''n'X
|
;
E: E'='E
|E'='N
|E'+'N
|E'-'N
|E'+''+'
|E'-''-'
|E'<'E
|E'>'E
|E'<'N
|E'>'N
|ID
|
;
N: NUM
;
%%
int main()
{
yyparse();
printf("%d",temp);
}

int yyerror(char *msg)
{
printf("error YACC %s\n",msg);
exit(0);
}

