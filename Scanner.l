%top{

	extern int yyparse();

	#include <vector>
	#include <iostream>
	#include "Parser.h"
	using namespace std;
}

%{
	/************************/
	/*	Global Variables	*/
	/************************/

	int charCnt = 1;
%}

%option noyywrap

	/*	Regular Expressions Definition	*/

ALPHA		[a-zA-Z0-9_!=<>.{}()\[\]*+\-;#$ \t\n\r/]
LTE 		"<="
LT 			"<"
GTE 		">="
GT 			">"
EE 			"=="
NE 			"!="
ASSIGN 		"="
PLUS 		"+"
MINUS 		"-"
TIMES 		"*"
DIVIDE 		"/"
FLOAT		[Ff][Ll][Oo][Aa][Tt]
NOTALPHA	[^a-zA-Z0-9_!=<>.{}()\[\]*+\-;#$ \t\n\r/]
ELSE		[Ee][Ll][Ss][Ee]
IF			[Ii][Ff]
INT			[Ii][Nn][Tt]
RETURN		[Rr][Ee][Tt][Uu][Rr][Nn]
VOID		[Vv][Oo][Ii][Dd]
WHILE		[Ww][Hh][Ii][Ll][Ee]
LETTER		[a-zA-Z]
DIGIT		[0-9]
NUM			{DIGIT}+(\.{DIGIT}*)?((E|e)(\+|\-)?{DIGIT}+)?
WRONGNUM	{DIGIT}+(\.{DIGIT}*)?(E|e)(\+|\-)?
ID			{LETTER}({LETTER}|{DIGIT})*((\.|#|\$|_)?({LETTER}|{DIGIT})+)?
WRONGID		{LETTER}({LETTER}|{DIGIT})*(\.|#|\$|_)
OPENCOM		"/*"
CLOSECOM	"*/"
COMMENT		{OPENCOM}(.|[\n\r])*?{CLOSECOM}
COMMA 		,
DELIM 		;
OPENB 		"{"
CLOSEB		"}"
OPENSB		"["
CLOSESB		"]"
OPENP 		"("
CLOSEP		")"

%%
			/*	OTHER	*/
\n			{yylineno++; charCnt = 1;}
{COMMENT}	{}
[ \t]		{charCnt++;}

			/*	TOKENS	*/

{ELSE}		{charCnt+=strlen(yytext); return ELSE; }
{IF}		{charCnt+=strlen(yytext); return IF; }
{INT}		{charCnt+=strlen(yytext); return INT; }
{FLOAT}		{charCnt+=strlen(yytext); return FLOAT; }
{VOID}		{charCnt+=strlen(yytext); return VOID; }
{WHILE}		{charCnt+=strlen(yytext); return WHILE; }
{NUM}		{charCnt+=strlen(yytext); return NUM; }
{ID}		{charCnt+=strlen(yytext); return ID; }
{COMMA}		{charCnt+=strlen(yytext); return COMMA; }
{DELIM}		{charCnt+=strlen(yytext); return DELIM; }
{OPENB}		{charCnt+=strlen(yytext); return OPENB; }
{CLOSEB}	{charCnt+=strlen(yytext); return CLOSEB; }
{OPENSB}	{charCnt+=strlen(yytext); return OPENSB; }
{CLOSESB}	{charCnt+=strlen(yytext); return CLOSESB; }
{OPENP}		{charCnt+=strlen(yytext); return OPENP; }
{CLOSEP}	{charCnt+=strlen(yytext); return CLOSEP; }
{PLUS}		{charCnt+=strlen(yytext); return PLUS; }
{MINUS}		{charCnt+=strlen(yytext); return MINUS; }
{TIMES}		{charCnt+=strlen(yytext); return TIMES; }
{DIVIDE}	{charCnt+=strlen(yytext); return DIVIDE; }
{LTE}		{charCnt+=strlen(yytext); return LTE; }
{LT}		{charCnt+=strlen(yytext); return LT; }
{GTE}		{charCnt+=strlen(yytext); return GTE; }
{GT}		{charCnt+=strlen(yytext); return GT; }
{EE}		{charCnt+=strlen(yytext); return EE; }
{NE}		{charCnt+=strlen(yytext); return NE; }
{ASSIGN}	{charCnt+=strlen(yytext); return ASSIGN; }
			
	/*	ERRORS	*/

{OPENCOM}		{


	cout <<"Open comment not closed .. Line " << yylineno << " at Idx: " << charCnt << endl;
	exit(-1);

}


{NOTALPHA}		{

	cout <<yytext<<" not part of the alpabet .. Line " << yylineno << " at Idx: " << charCnt << endl;
	exit(-1);
}


{WRONGNUM}		{

	cout <<"Invalid number format: " << yytext <<" .. Line " << yylineno << " at Idx: " << charCnt << endl;
	exit(-1);

}



{WRONGID}		{

	cout <<"Invalid identifier format: " << yytext << ".. Line " << yylineno << " at Idx: " << charCnt << endl;
	exit(-1);
}

%%

void yyerror (const char* s, ...){
	
	va_list ap;
	va_start(ap, s);
	fprintf (stderr, "Line %d: ", yylineno);
	vfprintf (stderr, s , ap);
	fprintf(stderr,"\n");
}


int main(int argc, const char* argv[])
{
	if (argc<2){
		cout << "No input file found"<<endl;
		return 0;
	}
	FILE* inputFile = fopen (argv[1],"r");
	yyrestart(inputFile);
	yyparse();
	fclose (inputFile);

	return 0;
}





