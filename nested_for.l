%{
	#include<stdio.h>
	#include<stdlib.h>
	char cond[1000][1000],stmt[1000][1000],inc[1000][1000],init[1000][1000],*toks;
	int i=0,j=0,k=0;
%}
num [0-9]+
id [a-zA-Z]+[a-zA-Z0-9]*
relop "<"|">"|"=="
init {id}"="({num}|{id})
cond ({id}|{num}){relop}({num}|{id})
inc (("++"|"--"){id}|{id}("++"|"--"))

%%
"for("{init}";"{cond}";"{inc}")"	{

toks = strchr(yytext,'(');
char *temp;
temp = strtok(toks+1,";");
strcpy(init[i],temp);
//printf("%s",init[i]);
temp = strtok(NULL,";");
strcpy(cond[i],temp);
//printf("\n%s",cond[i]);
temp = strtok(NULL,")");
strcpy(inc[i],temp);
i++;
}
"{"(.)* {
// strcpy(strrchr(yytext,'{'),"\0");
 strcpy(stmt[k],yytext);
//strcpy(strrchr(stmt[k],'{'),"\0");
k++;
}
\n {}
. {}
%%
int main(){
yylex();
printf("for(");
for(j=0;j<i;j++)
{
	printf("%s",init[j]);
if(j!=i-1)
	printf(",");
}
printf(";");
for(j=0;j<i;j++)
{
	printf("%s",cond[j]);
if(j!=i-1)	printf(",");
}
printf(";");
for(j=0;j<i;j++)
{
	printf("%s",inc[j]);
	if(j!=i-1)printf(",");
}
	printf(")\n{");
for(j=0;j<k;j++)
 printf("%s } \n",stmt[j]);

printf("\n}");

return 0;
}
int yywrap()
{
return 1;
}
