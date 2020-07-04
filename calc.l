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
[0-9]+ {yylval = atoi(yytext); return INTEGER;}
[-+*/] {return *yytext;}
\n {return *yytext;}
; {return *yytext;}
. {char msg[25]; sprintf(msg,"%s <%s>","invalid character",yytext); yyerror(msg);}
