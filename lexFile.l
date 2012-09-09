%option yylineno
%{
/*
    Lyle Johnson
    lexParser.l

*/

#include <string.h>
//#include "y.tab.h"
//#include "token.h"	/* a struct type for tokens */

struct token *yytokens;	/* a global array of all tokens */
int yyntokens;		/* number of tokens in source file */
int yynallocated=0;	/* size of dynamic array */
int newlineflag;	/* did a newline occur between last token and this? */

%}

%%

[\t]			{ printf("<PRE> </PRE>"); }
[" "] 			{ printf(" ");  }
[\n]			{ newlineflag++; printf("<BR></BR>"); }
["/\\*\\*.*?\\*/"]	{ printf("<font color = \"red\"> %s< /font>", yytext ); }


abstract 		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
assert			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
boolean			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
break			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
byte			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
case 			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
catch			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
char			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
class			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
const			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
continue		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
default			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
do			{ printf("<font color = \"blue\"> %s< /font>", yytext ); } 
double			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
else			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
enum			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
extends			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
final			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
finally			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
float			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
for			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
goto			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
if			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
implements		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
import			{ printf("<font color = \"blue\"> %s< /font>", yytext ); } 
instanceof		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
int			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
interface		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
long			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
native			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
new			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
package			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
(private)		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
(protected)		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
(public)		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
return			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
short			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
static			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
strictfp		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
super			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
switch			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
synchronized		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
this			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
throw			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
throws			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
transient		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
try			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
void			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
volatile		{ printf("<font color = \"blue\"> %s< /font>", yytext ); }
(while)			{ printf("<font color = \"blue\"> %s< /font>", yytext ); }

%%

int main()
{
  yylex();
  return 0;
}


/*
g++ lex.yy.c -ll
http://aquamentus.com/tut_lexyacc.html
*/
