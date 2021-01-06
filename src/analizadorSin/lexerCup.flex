package analizadorSin;
import java_cup.runtime.Symbol;

%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

// Alfabetos

L = [a-zA-Z_]+
D = [0-9]+
x = [ ,\n,\t,\r]+

%{
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
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

Entero      {return new Symbol(sym.Entero, yychar, yyline, yytext());}
( byte | char | long | float | double ) {return new Symbol(sym.T_dato, yychar, yyline, yytext());}
{ol}        {return new Symbol(sym.Op_log, yychar, yyline, yytext());}
{or}        {return new Symbol(sym.Op_rel, yychar, yyline, yytext());}
{op}        {return new Symbol(sym.Op_ar, yychar, yyline, yytext());}
Programa    {return new Symbol(sym.Programa, yychar, yyline, yytext());}
FinPrograma {return new Symbol(sym.FinPrograma, yychar, yyline, yytext());}
Leer        {return new Symbol(sym.Leer, yychar, yyline, yytext());}
Escribir    {return new Symbol(sym.Escribir, yychar, yyline, yytext());}
Si          {return new Symbol(sym.Si, yychar, yyline, yytext());}
Entonces    {return new Symbol(sym.Entonces, yychar, yyline, yytext());}
Sino        {return new Symbol(sym.Sino, yychar, yyline, yytext());}
FinSi       {return new Symbol(sym.FinSi, yychar, yyline, yytext());}
Hacer       {return new Symbol(sym.Hacer, yychar, yyline, yytext());}
Mientras    {return new Symbol(sym.Mientras, yychar, yyline, yytext());}
FinMientras {return new Symbol(sym.FinMientras, yychar, yyline, yytext());}
Para        {return new Symbol(sym.Para, yychar, yyline, yytext());}
hasta       {return new Symbol(sym.Hasta, yychar, yyline, yytext());}
FinPara     {return new Symbol(sym.FinPara, yychar, yyline, yytext());}
{cad}       {return new Symbol(sym.Cadena, yychar, yyline, yytext());}
{num}       {return new Symbol(sym.Numero, yychar, yyline, yytext());}
{real}      {return new Symbol(sym.Real, yychar, yyline, yytext());}
{id}        {return new Symbol(sym.Identificador, yychar, yyline, yytext());}
"="         {return new Symbol(sym.Igual, yychar, yyline, yytext());}
";"         {return new Symbol(sym.P_coma, yychar, yyline, yytext());}
"("         {return new Symbol(sym.P_izq, yychar, yyline, yytext());}
")"         {return new Symbol(sym.P_der, yychar, yyline, yytext());}

{x}     {}
"//".*  {}
{com}   {}    
 .      {return new Symbol(sym.Error, yychar, yyline, yytext());}