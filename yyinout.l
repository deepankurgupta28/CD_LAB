%{
#include<stdio.h>
int p=0, s=0;
%}
%%
"printf" {p++; fprintf(yyout,"writef"); printf("%s",yytext);}
"scanf" {s++; fprintf(yyout,"readf"); printf("%s",yytext);}
. ;
%%
int main(int argc, char* argv[])
{
	yyin=fopen(argv[1],"r+");
	yyout=fopen(argv[1],"r+");
	yylex();
	printf("The number of printf = %d",p);
	printf("The number of scanf = %d",s);
}