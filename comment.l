%{
	#include<stdio.h>
	char *temp;
%}
%%
"/*"(.*)"*/"	{
	temp=strchr(yytext,'*');
	char *toks;
	toks=strtok(temp+1,"*");
	printf("%s",toks);}
%%
int main()
{
yylex();
return 0;
}
int yywrap()
{
return 1;
}
