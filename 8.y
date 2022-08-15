%{
#include<stdio.h>
#include<stdlib.h>
#include<fcntl.h>
struct table{
	char op1,op2,oper,res;
};
struct table t[20];
int idx=0;
char inTab(char, char, char);
%}
%token letter
%left '+''-'
%left '*''/'
%%
S : E;
E : E '+' E { $$ = inTab((char)$1, (char)$3, '+'); }
|   E '-' E { $$ = inTab((char)$1, (char)$3, '-'); }
|   E '*' E { $$ = inTab((char)$1, (char)$3, '*'); }
|   E '/' E { $$ = inTab((char)$1, (char)$3, '/'); }
|   '(' E ')' {$$ = (char)$2; }
|   letter    {$$ = (char)$1; };
%%

char inTab(char op1, char op2, char oper)
{
	t[idx].op1 = op1;
	t[idx].op2 = op2;
	t[idx].oper = oper;
	
	char c = 'A' + idx;
	t[idx].res = c;
	idx++;
	return c;
}

void generate_assembly()
{
	for(int i=0; i<idx; i++)
	{
		if(islower(t[i].op1))
		{
			printf("LD %c,R1\n",t[i].op1);
		}
		else
		{
			printf("MOV R%d,R1\n",t[i].op1-'A'+3);
		}
		if(islower(t[i].op2))
		{
			printf("LD %c,R2\n",t[i].op2);
		}
		else
		{
			printf("MOV R%d,R2\n",t[i].op2-'A'+3);
		}
		
		switch(t[i].oper)
		{
			case '+' :
				printf("ADD R1,R2\n");
				break;
			case '-' :
				printf("SUB R1,R2\n");
				break;
			case '*' :
				printf("MUL R1,R2\n");
				break;
			case '/' :
				printf("DIV R1,R2\n");
				break;
		}
		printf("MOV R1,R%d\n\n",t[i].res-'A'+3);
	}
	printf("STR res, R%d\n",t[idx-1].res-'A'+3);
}

int main()
{
	yyparse();
	for(int i=0; i<idx; i++)
	{
		printf("%c = %c %c %c\n",t[i].res, t[i].op1, t[i].oper, t[i].op2);
	}
	printf("\n\n");
	generate_assembly();
}

int yyerror()
{
	printf("Error\n");
	exit(0);	
}