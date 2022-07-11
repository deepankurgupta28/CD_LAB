%{
#include<stdio.h>
int sing=0, mult=0, c=0;
%}
%%
[\n] {if(sing==1) c++; if(sing==0 && mult==0) fprintf(yyout,"\n"); sing=0;}
"//" {if(mult==0) sing=1;}
"/*" {mult=1;}
"*/" {if(sing==0) c++; mult=0;}
~ return 0;
. if(sing==0 && mult==0) fprintf(yyout,"%s",yytext);
%%
int main()
{
        yyin = fopen("file1.txt","r");
        yyout = fopen("file2.txt","w");
        yylex();
        printf("Num of comms = %d", c);
}
