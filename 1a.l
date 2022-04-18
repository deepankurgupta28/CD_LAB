%{
	#include<stdio.h>
	int words=0, lines=1, ch=0, wh=0, num=0;
%}
%%
[0-9a-zA-Z]+ {words++; ch+=yyleng;}
" " wh++;
\n lines++;
. ch++;
%%
int main()
{
	printf("Enter input\n");
	yylex();
	printf("\nnumber of words = %d\n",words);
	printf("number of lines = %d\n",lines);
	printf("number of whitespaces = %d\n",wh);
	printf("number of characters = %d\n",ch);
}
