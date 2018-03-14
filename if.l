%{
	#include<stdio.h>
	#include<stdlib.h>
	char *cond,stmt[100][100],*inc,*toks;
         int i=0,k=0;
        char conds[100][100];
%}
num [0-9]+
id [a-zA-Z]+[a-zA-Z0-9]*
relop "<"|">"|"=="
init {id}"="({num}|{id})
cond ({id}|{num}){relop}({num}|{id})
inc (("++"|"--"){id}|{id}("++"|"--"))

%%
"if("{id}{relop}{num}")"	{

char *temp;
toks = strchr(yytext,'(');
temp = strtok(toks+1,")");
strcpy(conds[i],temp);
//printf("\n%s",temp);
i++;
}
"{"(.*) {
strcpy(stmt[k],yytext);
//strcpy(strrchr(stmt[k],'{'),"\0");
k++;
}
. {}
\n {}
%%

int main(){

yylex();
int j=0;
printf("if(");
for(j=0;j<i;j++){
printf("%s",conds[j]);
if(j!=i-1)
printf(" && ");
}
printf(")\n{\n");

for(j=0;j<k;j++){
printf("\n%s",stmt[j]);
}
printf("\n}");
return 0;
}
