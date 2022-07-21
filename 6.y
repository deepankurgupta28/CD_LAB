%{
#include<stdio.h>
#include<stdlib.h>
struct table{
int op1;
int op2;
int operator;
};
struct table t[100];
int id=0;
%}
%token val
%left '+' '-'
%left '*' '/'

%%
A :E    
  ;
E :E'+'E    {$$=insertIntoTable($1,$3,'+');}
  |
   E'-'E    {$$=insertIntoTable($1,$3,'-');}
  |
   E'*'E    {$$=insertIntoTable($1,$3,'*');}
  |
   E'/'E    {
            if($3==0){
              yyerror();
            }
           $$=insertIntoTable($1,$3,'/');
           }
  |
   val    {$$=$1;}
  ; 
%%

int insertIntoTable(int op1,int op2,int operator){
  t[id].op1=op1;
  t[id].op2=op2;
  t[id].operator=operator;
  id+=1;
  return 'A'+id-1;
}

void printThreeAddressCode(){
  int c_id=0;
  printf("Three address code:\n");
  while(c_id<id){
    printf("%c = %c %c %c \n",c_id+'A',t[c_id].op1,t[c_id].operator,t[c_id].op2);
    c_id+=1;
  }
}

void printQuadraple(){
 int c_id=0;
 printf("\nQuadraple:\n");
 printf("#   operator   op1   op2  result\n");
  while(c_id<id){
    printf("[%d]\t%c\t%c\t%c\t%c\n",c_id, t[c_id].operator,t[c_id].op1,t[c_id].op2,c_id+'A');
    c_id+=1;
  }
}

void printTriple(){
 int c_id=0;
 printf("\nTriple:\n"); 
 printf("#   operator   op1    op2\n");
  while(c_id<id){
    int op1=t[c_id].op1;
    int op2=t[c_id].op2;

    if(op1<97){
      op1=op1-'A'+'0';
    }
    if(op2<97){
      op2=op2-'A'+'0';
    } 
    printf("[%d]\t%c\t%c\t%c\n",c_id,t[c_id].operator,op1,op2);
    c_id+=1;
  }
}


void yyerror(){
  printf("Error in expression:\n");
  exit(0);
}

int main(){
  yyparse();
  printf("\nGrammar parsed sucessfully\n\n");
  printThreeAddressCode();
  printQuadraple();
  printTriple();
  return 0;
}
