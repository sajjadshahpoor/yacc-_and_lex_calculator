PROGRAM       = calc
OBJS          = calc.tab.o lex.yy.o 
SRCS          = calc.tab.c lex.yy.c     
CC            = gcc      
all:            $(PROGRAM) 
	 
.c.o:           $(SRCS)
		$(CC) -c $*.c -o $@ -O
			 
calc.tab.c:     calc.y
	        bison -d calc.y
			 
lex.yy.c:       calc.l 
	        flex calc.l
			 
calc:           $(OBJS)
	        $(CC) $(OBJS)  -o proj1 -lfl -lm
			 
clean:;         rm -f $(OBJS) core *~ \#* *.o proj1 $(PROGRAM) \
	                y.* lex.yy.* calc.tab.*
test : 	
	./proj1 < $(file)
