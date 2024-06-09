package codigo;
import static codigo.Tokens.*;
%%
%class Lexer
%type Tokens
L=[a-zA-Z_]+
D=[0-9]+
espacio=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%
int |
if |
else |
char |
bool |
return |
true |
false |
while {lexeme=yytext(); return Reservadas;}
{espacio} {/*Ignore*/}
"//".* {/*Ignore*/}
"="  {return Igual;}
"+"  {return Suma;}
"-"  {return Resta;}
"*"  {return Multiplicacion;}
"/"  {return Division;}
"==" {return Igual;}
"!=" {return Negacion; }
"<"  {return Menor A; }
">"  {return Mayor A; }
"<=" {return Menor igual a; }
">=" {return Mayor igual a; }
"("  {return Parentesis a; }
")"  {return parentesis c; }
"{"  {return llave a; }
"}"  {return llave c; }
";"  {return Punto y coma; }
","  {return Coma; }
{L}({L}|{D})* {lexeme=yytext(); return Identificador;}
("(-"{D}+")")|{D}+ {lexeme=yytext(); return Numero;}
 . {return ERROR;}
