%{
	#include<stdio.h>
	#include<stdlib.h>
%}
%token NUM
%left	'+' '-'
%left	'*' '/'
%right NEGATIVE
%%
S: E {printf("\nResult:%d",$1);}
   ;
E: E '+' E {$$=$1+$3;}
  | E '-' E {$$=$1-$3;}
  | E '*' E {$$=$1*$3;;}
  | E '/' E {$$=$1/$3;}
  | '(' E ')'{$$=$2;}
  | '-' E %prec NEGATIVE {$$=-$2;}
  | NUM {}
  ;
%%
int main()
{
	yyparse();
}
int yyerror(char *msg)
{
	return printf("error YACC: %s\n",msg);
} 
