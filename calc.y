


%{
#include <stdlib.h>
#include <stdio.h>
#include <math.h>
int yylex();
void yyerror(const char *s);
%}

%token INTEGER


%left '+' '-'        			//for both "+" and "-" precedence
%left '*' '/' '%'			//for "+", "/" and "%" precendence
%left '^'				// for "^" precedence 
%nonassoc UMINUS			


%%

program:
       program line | line
line: expr ';' {printf("%d\n",$1); } 
	    ; | '\n'

expr :	  expr '+' expr { $$ = $1 + $3; } 
	| expr '-' expr { $$ = $1 - $3; }
	| expr '%' expr { $$ = $1 % $3; }
	| expr '^' expr { $$ = pow($1,$3); }		
	| expr '*' expr { $$ = $1 * $3; }
	| expr '/' expr 
			{
				if ($3 == 0.0)
					printf("Divided by Zero!!");  // if user try to divide it over "0" it will print error message.
				else 
					$$ = $1 / $3;

			}

	| '-' expr %prec UMINUS { $$ = -$2; }

expr: '(' expr ')'  {$$ = $2;}
	| INTEGER;


%%
void yyerror(const char *s) 
{ 
	fprintf(stderr,"%s\n",s); 
	return ; 
}
int main(void) { 
	/*yydebug=1;*/ 
	yyparse(); 
	return 0; 
}
