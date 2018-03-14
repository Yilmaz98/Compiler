%{
	#include<stdio.h>
	#include<stdlib.h>
	int ch=0,nl=0,wr=0,op=0;
%}
%%
[+\-*/] {op++;}
[^\n\t] {ch++;}
[\n]	{nl++; wr++;}
[\t''] {wr++;}
%%
int main()
{
	yylex();
	printf("Characters:%d\n",ch);
	printf("Words:%d\n",wr);
	printf("Lines:%d",nl);
	printf("Operators:%d",op);
	return 0;
}

