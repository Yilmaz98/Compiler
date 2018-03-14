",conds[j]);
if(j!=i-1)
printf(" && ");
}
printf(")");({
#iinclude<stdio.h>
	#include<stdlib.h>
	char cond[1000],stmt[1000],inc[1000],init[1000],*toks;
%}
num [0-9]+
id [a-zA-Z]+[a-zA-Z0-9]*
relop "<"|">"|"=="
init {id}"="({num}|{id})
cond ({id}|{num}){relop}({num}|{id})
inc (("++"|"--"){id}|{id}("++"|"--"))

%%
"for("{init}";"{id}{relop}{num}";"{inc}")"	{

toks = strchr(yytext,'(');
char *temp;
temp = strtok(toks+1,";");
strcpy(init,temp);
temp = strtok(NULL,";");
strcpy(cond,temp);
temp = strtok(NULL,")");
strcpy(inc,temp);
}
"{"(.|\n)*"}" {
strcpy(stmt,yytext+1);
strcpy(strrchr(stmt,'}'),"\0");
}
. {}
\n {}
%%

int main(){
yylex();
printf("%s\n",init);
printf("do{\n");
printf("%s",stmt);
printf("%s;",inc);
printf("\n}while(%s);",cond);
return 0;
}
