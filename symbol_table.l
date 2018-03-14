%{
	#include<stdio.h>
	#include<stdlib.h>
	char temp[100];
        struct st{
       char lex[100],tokens[100],type[100];
    }s[100];
  int i=0;
%}
id	[a-zA-Z]+[a-zA-Z0-9]*
num	[0-9]+
relop   ">="|"<="|"=="|">"|"<"
keyword "if"|"else"|"for"|"while"|"printf"
%%
("int"|"float"|"char"|"double") {

strcpy(s[i].lex,yytext);strcpy(s[i].tokens,"keyword"); strcpy(temp,yytext);strcpy(s[i].type," ");
i++;
}
{keyword} {                                                                                                                                                                                                        strcpy(s[i].lex,yytext);strcpy(s[i].tokens,"keyword"); strcpy(s[i].type," ");                                                                                                                                      i++;                                                                                                                                                                                                               }  
{id} {
strcpy(s[i].lex,yytext);strcpy(s[i].tokens,"identifier"); strcpy(s[i].type,temp); 
i++;
}
{relop} {
strcpy(s[i].lex,yytext);strcpy(s[i].tokens,"operator"); strcpy(s[i].type,"relop");  
i++;
}
{num} {
strcpy(s[i].lex,yytext);strcpy(s[i].tokens,"const"); strcpy(s[i].type," "); 
i++;
}
. {}

\n {}
%%

int main(){

yylex();
int j;
printf("TOKEN\t\tLEXEME\t\t\tTYPE");
for(j=0;j<i;j++){
printf("\n%s\t\t%s\t\t%s\t",s[j].tokens,s[j].lex,s[j].type);
//printf("\n");
}
return 0;
}
