%{
#include<stdio.h>
int id=0,key=0,op=0;
%}
%%
#.* {id++;key++;}
\".*\" ;
"auto"|"double"|"int"|"struct"|"else"|"for"|"if"|"main" key++;
[a-zA-Z_][a-zA-Z0-9_]* id++;
"+"|"-"|"/"|"*"|"++"|"=="|"<="|">=" op++;
. ;
'EOF' return 0;
%%
main()
{
	yyin=fopen("prog.txt","r");
	yylex();
	printf("Keywords=%d Identifiers=%d Operators=%d\n",key,id,op);
}
