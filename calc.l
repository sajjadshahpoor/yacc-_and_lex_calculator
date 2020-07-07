

%{
#include <stdlib.h>
#include <stdio.h>
void yyerror(char*);
extern int yylval;
#include "calc.tab.h" 
#include<time.h>
%}

%%
[ \t]+ ;

[0-9]+ {
	yylval = atoi(yytext); 
	
return INTEGER;
}

MAGIC {						//MAGIC functio to generat random numbers from 0 - 100
	srand(time(0)); 		
	int k = rand() % 101 ;
	yylval = atoi(yytext) + k;
	//printf("%s is a word\n", yytext);
return INTEGER;
}

(O)+N(E)+ {					//for recognizing ONE as 1 value beside and it's derivatives
		int i = 1;
		yylval = atoi(yytext) + i; 
	
return INTEGER;
}

(T)+W(O)+ {					// for two as 2 and it's derivatives
		//int i = 2;
		yylval = atoi(yytext) + 2; 
	
return INTEGER;
}

(T)+HRE(E)+ {					//for three as 3 and it's derivatives
		
		yylval = atoi(yytext) + 3; 
	
return INTEGER;
}

(F)+OU(R)+ {					// for four as 4 and it's derivatives
		
		yylval = atoi(yytext) + 4; 
	
return INTEGER;
}

(T)+E(N)+ {					// for ten as 10 and it's derivatives
		
		yylval = atoi(yytext) + 10; 
return INTEGER;
}

[-+*/%^] {
return *yytext;
}

\n {
return *yytext;
}

; {
return *yytext;
}

. {
char msg[50]; 
sprintf(msg,"%s <%s>","invalid character or Invalid Operation",yytext); 
yyerror(msg);
}
