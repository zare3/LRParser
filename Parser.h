/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     LTE = 258,
     LT = 259,
     IF = 260,
     GTE = 261,
     GT = 262,
     EE = 263,
     NE = 264,
     PLUS = 265,
     MINUS = 266,
     TIMES = 267,
     DIVIDE = 268,
     ID = 269,
     VOID = 270,
     FLOAT = 271,
     INT = 272,
     OPENSB = 273,
     CLOSESB = 274,
     OPENP = 275,
     CLOSEP = 276,
     OPENB = 277,
     CLOSEB = 278,
     DELIM = 279,
     COMMA = 280,
     EPSILON = 281,
     NUM = 282,
     ASSIGN = 283,
     WHILE = 284,
     ELSE = 285
   };
#endif
/* Tokens.  */
#define LTE 258
#define LT 259
#define IF 260
#define GTE 261
#define GT 262
#define EE 263
#define NE 264
#define PLUS 265
#define MINUS 266
#define TIMES 267
#define DIVIDE 268
#define ID 269
#define VOID 270
#define FLOAT 271
#define INT 272
#define OPENSB 273
#define CLOSESB 274
#define OPENP 275
#define CLOSEP 276
#define OPENB 277
#define CLOSEB 278
#define DELIM 279
#define COMMA 280
#define EPSILON 281
#define NUM 282
#define ASSIGN 283
#define WHILE 284
#define ELSE 285




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

