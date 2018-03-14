#include<stdio.h>
#include<string.h>
#include<ctype.h>
int main(){

char arr[20];

strcpy(arr,"aaaaa");
//gets(arr);
int i=0;
while(arr[i] != '\0')
{
 arr[i]= toupper(arr[i]);
 i++;
}
printf("%s",arr);
return 0;
}
