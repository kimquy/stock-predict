%option yylineno
%{
/*
*   Lyle Johnson - Kimquy Stock Predict
*   lexParser.l
*	Compiler note at the bottom
*	
*	Next Step: implement website sentiment analysis thru alchemy.
*/

#include <string.h>
#include <stdio.h>
//#include "y.tab.h"
//#include "token.h"		/* a struct type for tokens */

struct token *yytokens;		/* a global array of all tokens */
int yyntokens;				/* number of tokens in source file */
int yynallocated=0;			/* size of dynamic array */

/* 
** Any flags that we need to tokenize. Will be implemented with bison 
** in the future (?). We want to match any buzzwords, keywords, anything 
** with very positive or negative feedback. 
**
**	(http|https)://[a-zA-Z]?\.co/[a-zA-Z0-9]*
*/

int newlineflag;	
int newFlag;
int introducingFlag;
int updateFlag;
int betterFlag;
int greaterFlag;
int improvedFlag;
int refFlag;
int hashFlag;
int productFlag;
int discoverFlag;
int urlFlag;
int availableFlag;
int easyFlag;
int releaseFlag;
int failFlag;
int lossFlag;
int dropFlag;
int bombFlag;

%}

%%

"http://t.co/"[a-zA-Z0-9]*		{ urlFlag++; printf("%s", yytext ); }
#								{ hashFlag++; 
									printf( "%s", yytext );
								}
@								{ refFlag++; printf( "%s", yytext ); }
available						{ availableFlag++; printf("%s", yytext ); }
new|newest|newer				{ newFlag++; printf( "%s", yytext ); }
introducing|introduce			{ introducingFlag++; printf( "%s", yytext ); }
update|updates					{ updateFlag++; printf( "%s", yytext ); }
better|best						{ betterFlag++; printf( "%s", yytext ); }
improved|improve				{ improvedFlag++; printf( "%s", yytext ); } 
product|products				{ productFlag++; printf( "%s", yytext ); }
discover|discovering|discovered	{ discoverFlag++; printf( "%s", yytext ); }

easy|easier|easily				{ easyFlag++; printf( "%s", yytext ); }
release|released|releasing		{ releaseFlag++; printf( "%s", yytext ); }
fail|failed|failure				{ failFlag++; printf( "%s", yytext ); }
loss|lost|lose					{ lossFlag++; printf( "%s", yytext ); }
drop|dropped|dropping			{ dropFlag++; printf( "%s", yytext ); }
bomb|bombed						{ bombFlag++; printf( "%s", yytext ); }

.				{;}

%%

int yywrap(void) 
{
	return 1;
}

int main( int argc, char *argv[] )
{
	easyFlag = 0;
	releaseFlag = 0;
	failFlag = 0;
	lossFlag = 0;
	dropFlag =0;
	bombFlag = 0;
	hashFlag = 0;
	newFlag = 0;
	introducingFlag = 0;
	updateFlag = 0;
	betterFlag = 0;
	improvedFlag = 0;
	refFlag = 0;
	productFlag = 0;
	discoverFlag = 0;
	availableFlag = 0;
	urlFlag = 0;
	
	yyin = fopen( argv[1], "r" );
	
	yylex();
	yywrap();
	
	printf("\n Number of 'Reference' Flags: %d", refFlag );
	printf("\n Number of 'New' Flags: %d", newFlag );
	printf("\n Number of 'Introducing' Flags: %d", introducingFlag );
	printf("\n Number of 'Update' Flags: %d", updateFlag );
	printf("\n Number of 'Better' Flags: %d", betterFlag );
	printf("\n Number of 'Improved' Flags: %d", improvedFlag );
	printf("\n Number of 'URL' Flags: %d ", urlFlag);
	printf("\n Number of 'Available' Flags: %d ", availableFlag);
	printf("\n Number of 'Easy' Flags: %d ", easyFlag);
	printf("\n Number of 'Release' Flags: %d ", releaseFlag);
	printf("\n Number of 'Fail' Flags: %d", failFlag);
	printf("\n Number of 'Loss' Flags: %d ", lossFlag);
	printf("\n Number of 'Drop' Flags: %d ", dropFlag);
	printf("\n Number of 'Bomb' Flags: %d ", bombFlag);
	printf("\n Number of 'Hash' Flags: %d \n\n", hashFlag);
		
	fclose( yyin );
}

/*
To compile:
lex lexFile.l
cc lex.yy.c -ll
Then run ./a.out tweets.txt (the tweets.txt file is from ruby.)
*/
