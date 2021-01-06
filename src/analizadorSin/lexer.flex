package analizadorSin;
import static analizadorSin.Tokens.*;

%%
%class Lexer
%type Tokens

// Alfabetos

L = [a-zA-Z_]+
D = [0-9]+
x = [ ,\n,\t,\r]+

%{
    public String lexeme;
%}

// Expresiones

num = "-"?{D}+
real = "-"?{D}+"."{D}+
id = {L}({L}|{D})*
cad = "'"({L}|{D}|" ")* "'"
com = "#" ({L}|{D}|" ")+
ol = "|"|"&"
or = "<" |"<="| ">="|"=="|"!="|">"
op = "+" | "-" | "*" |"/"
%%

Entero      {lexeme=yytext(); return Entero;}
( byte | char | long | float | double ) {lexeme=yytext(); return T_dato;}
{ol}        {lexeme=yytext(); return Op_log;}
{or}        {lexeme=yytext(); return Op_rel;}
{op}        {lexeme=yytext(); return Op_ar;}
Programa    {lexeme=yytext(); return Programa;}
FinPrograma {lexeme=yytext(); return FinPrograma;}
Leer        {lexeme=yytext(); return Leer;}
Escribir    {lexeme=yytext(); return Escribir;}
Si          {lexeme=yytext(); return Si;}
Entonces    {lexeme=yytext(); return Entonces;}
Sino        {lexeme=yytext(); return Sino;}
FinSi       {lexeme=yytext(); return FinSi;}
Hacer       {lexeme=yytext(); return Hacer;}
Mientras    {lexeme=yytext(); return Mientras;}
FinMientras {lexeme=yytext(); return FinMientras;}
Para        {lexeme=yytext(); return Para;}
hasta       {lexeme=yytext(); return Hasta;}
FinPara     {lexeme=yytext(); return FinPara;}
{cad}       {lexeme=yytext(); return Cadena;}
{num}       {lexeme=yytext(); return Numero;}
{real}      {lexeme=yytext(); return Real;}
{id}        {lexeme=yytext(); return Identificador;}
"="         {lexeme=yytext(); return Igual;}
";"         {lexeme=yytext(); return P_coma;}
"("         {lexeme=yytext(); return P_izq;}
")"         {lexeme=yytext(); return P_der;}

{x}     {}
"//".*  {}
{com}   {}    
 .      {return ERROR;}