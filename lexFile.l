%option yylineno
%{
/*
*   Lyle Johnson - Kimquy Stock Predict
*   lexParser.l
*	Compiler note at the bottom
*/

#include <string.h>
#include <stdio.h>
//#include "y.tab.h"
//#include "token.h"	/* a struct type for tokens */

struct token *yytokens;	/* a global array of all tokens */
int yyntokens;		/* number of tokens in source file */
int yynallocated=0;	/* size of dynamic array */
int newlineflag;	/* did a newline occur between last token and this? */
int newFlag;
int introducingFlag;
int updateFlag;
int betterFlag;
int greaterFlag;
int improvedFlag;


%}

%%

@				{ printf("\n\n"); }
new				{ newFlag++; }
introducing		{ introducingFlag++; }
update			{ updateFlag++; }
better			{ betterFlag++; }
improved		{ improvedFlag++; }

[\n]			{ newlineflag++; printf("\n"); }

%%

int yywrap(void) 
{
	return 1;
}

int main( int argc, char *argv[] )
{
	yyin = fopen( argv[1], "r" );
	yylex();
	return 0;
	printf("\n%d\n", newFlag );
	fclose( yyin );
}

/*
To compile:
lex lexFile.l
cc lex.yy.c -ll
Then run ./a.out tweets.txt (the tweets.txt file is from ruby.)
*/
