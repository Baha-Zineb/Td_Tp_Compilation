%{
	#include<stdio.h>
	int flag=0;
	void yyerror(char *s);
	int yylex();
%}

%token NUMBER

%left '+''-'

%left '*' '/' '%'

%% 
ArithmeticExprssion:E{
	printf("\n Result=%d\n",$$);
	return 0;
};
E:E'+'E {$$=$1+$3;}
|E'-'E {$$=$1-$3;}
|E'*'E {$$=$1*$3;}
|E'/'E {$$=$1/$3;}
|E'%'E {$$=$1%$3;}
|'('E')' {$$=$2;}
| NUMBER {$$=$1;};

%%

void main()
{
printf("\n Enter Any Arithmetic Expression which\n");

yyparse();
if(flag==0)
{
	printf("\n Entred arithmetic expression is Valid");

}
}


void yyerror(char *s){
printf("error : %s",s);
}

