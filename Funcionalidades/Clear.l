/*
Enrique Casale Linde
Ejercicio 1 b). Practica 1 lex
*/

/*
Leer un texto y obtener:
--> Numero de caracteres
--> Numero de palabras
--> Lineas de codigo
Toda linea acaba en retorno de carro osea --> /n
*/


/*Seccion de Declaraciones*/

%{
#include <stdio.h>

//El numero de tabulaciones se calcula de la siguiente manera

/*
Para ciclos --> si es 0 --> 1 tabulacion
            --> Si es 1 o mas --> anidamiento + 1

Para operaciones --> Si es 0 --> 2 tabulaciones
                 --> Si es 1 o mas --> anidamiento + 2



*/

#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdio.h>
#include<errno.h>
#include<string.h>
#include<unistd.h>

int anidamiento;
int archivoAuxiliar;

%}


CUALQUIER_NOMBRE  (([a-z]+)|([A-Z]+)|([a-zA-Z]+)|([A-Za-z]+))
CUALQUIER_NUMERO  (([0-9]+))

%s IGUAL
%s MAYOR
%s MENOR
%s SUMA
%s RESTA
%s DIVISION
%s MULTIPLICACION
%s CORCHETES


%s IGUAL_2
%s MAYOR_2
%s MENOR_2
%s SUMA_2
%s RESTA_2
%s DIVISION_2
%s MULTIPLICACION_2
%s CORCHETES_2
%s LLAVE
%s LIBRERIA
%s LIBRERIA_2
%s LIBRERIA_3

%%
<INITIAL>(" ")                                {write(archivoAuxiliar,yytext,yyleng);}
<INITIAL>("\n")                               {write(archivoAuxiliar,yytext,yyleng);}
<INITIAL>("\t")                               {write(archivoAuxiliar,yytext,yyleng);}
<INITIAL>(({CUALQUIER_NOMBRE}))               {char aux[yyleng+1]; for(int i = 0; i < yyleng; i++){aux[i] = yytext[i];} aux[yyleng] = ' '; write(archivoAuxiliar,aux,yyleng+1);BEGIN(INITIAL);}
<INITIAL>({CUALQUIER_NUMERO})                 {write(archivoAuxiliar,yytext,yyleng);BEGIN(INITIAL);}
<INITIAL>(";")                                {write(archivoAuxiliar,yytext,yyleng);BEGIN(INITIAL);}
<INITIAL>("(")                                {char aux[yyleng+1];aux[0] = yytext[0]; aux[1] = ' '; write(archivoAuxiliar,aux,yyleng+1);BEGIN(INITIAL);}
<INITIAL>(")")                                {char aux[yyleng+1];aux[0] = ' '; aux[1] = yytext[0]; write(archivoAuxiliar,aux,yyleng+1);BEGIN(INITIAL);}
<INITIAL>("{")                                {char aux[2]; aux[0] = '\n'; aux[1] = '{'; write(archivoAuxiliar,aux,2);BEGIN(INITIAL);}
<INITIAL>("}")                                {char aux[3]; aux[0] = '\n'; aux[1] = '}'; aux[2] = '\n'; write(archivoAuxiliar,aux,3);BEGIN(INITIAL);}
<INITIAL>(",")                                {write(archivoAuxiliar,yytext,yyleng);BEGIN(INITIAL);}


<INITIAL>("#")("include")                                             {write(archivoAuxiliar,yytext,yyleng); BEGIN(LIBRERIA);}
<LIBRERIA>("<")                                                       {write(archivoAuxiliar,yytext,yyleng); BEGIN(LIBRERIA_2);}
<LIBRERIA>(\")                                                        {write(archivoAuxiliar,yytext,yyleng); BEGIN(LIBRERIA_3);}
<LIBRERIA_2>({CUALQUIER_NOMBRE}((\.)([a-z]+))?(">"))                  {char aux[yyleng+1]; for(int i = 0; i < yyleng; i++){aux[i] = yytext[i];} aux[yyleng+1] = '\n'; write(archivoAuxiliar,aux,yyleng+1);BEGIN(INITIAL);}
<LIBRERIA_3>({CUALQUIER_NOMBRE}((".")({CUALQUIER_NOMBRE}))?(\"))      {char aux[yyleng+1]; for(int i = 0; i < yyleng; i++){aux[i] = yytext[i];} aux[yyleng+1] = '\n'; write(archivoAuxiliar,aux,yyleng+1);BEGIN(INITIAL);}

<INITIAL>("#")({CUALQUIER_NOMBRE})                                    {write(archivoAuxiliar,yytext,yyleng); BEGIN(INITIAL);}


<INITIAL>("=")	             		{BEGIN(IGUAL_2);}
<IGUAL_2>("=")	             		{write(archivoAuxiliar," == ",4);BEGIN(INITIAL);}
<IGUAL_2>(.)  	             		{char aux[4]=" = "; strcat(aux,yytext); write(archivoAuxiliar,aux,4);BEGIN(INITIAL);}


<INITIAL>(">")		           		{BEGIN(MAYOR_2);}
<MAYOR_2>("=")		           		{write(archivoAuxiliar," >= ",4);BEGIN(INITIAL);}
<MAYOR_2>(.)	             	  	{char aux[4] = " > "; strcat(aux,yytext); write(archivoAuxiliar,aux,4);BEGIN(INITIAL);}



<INITIAL>("<")		            	{BEGIN(MENOR_2);}
<MENOR_2>("=") 		     		    {write(archivoAuxiliar," <= ",4);BEGIN(INITIAL);}
<MENOR_2>(.) 		    	        {char aux[4] = " < "; strcat(aux,yytext); write(archivoAuxiliar,aux,4); BEGIN(INITIAL);}

<INITIAL>("+")    		   		  	{BEGIN(SUMA_2);}
<SUMA_2>("=") 		   		      	{write(archivoAuxiliar," += ",4);BEGIN(INITIAL);}
<SUMA_2>("+")                 	  	{write(archivoAuxiliar,"++",2);BEGIN(INITIAL);}
<SUMA_2>(.)     		   	      	{char aux[4] = " + "; strcat(aux,yytext); write(archivoAuxiliar,aux,4);BEGIN(INITIAL);}


<INITIAL>("-")   		   	   	  	{BEGIN(RESTA_2);}
<RESTA_2>("-")                		{write(archivoAuxiliar,"--",2); BEGIN(INITIAL);}
<RESTA_2>("=") 		   		     	{write(archivoAuxiliar," -= ",4); BEGIN(INITIAL);}
<RESTA_2>({CUALQUIER_NUMERO}) 		{char aux[3] = " -"; strcat(aux,yytext); write(archivoAuxiliar,aux,3);BEGIN(INITIAL);}
<RESTA_2>(.) 		   	          	{char aux[4] = " - "; strcat(aux,yytext); write(archivoAuxiliar,aux,3); BEGIN(INITIAL);}


<INITIAL>("/")   	   	       		{BEGIN(DIVISION_2);}
<DIVISION_2>("=") 	   		   		{write(archivoAuxiliar," /= ",4);BEGIN(INITIAL);}
<DIVISION_2>(.)               		{char aux[4] = " / "; strcat(aux,yytext); write(archivoAuxiliar,aux,4); BEGIN(INITIAL);}

<INITIAL>("*")   		       	  	{BEGIN(MULTIPLICACION_2);}
<MULTIPLICACION_2>("=")		   		{write(archivoAuxiliar," *= ",4);BEGIN(INITIAL);}
<MULTIPLICACION_2>(.)   	   		{char aux[4] = " * "; strcat(aux,yytext); write(archivoAuxiliar,aux,4); BEGIN(INITIAL);}


%%

/*Seccion de Procedimientos*/


int main(int argc, char* argv[]){

	if(argc == 2){

		yyin = fopen(argv[1],"rt");

		if(yyin == NULL){

			printf("El fichero %s no se puede abrir \n",argv[1]);
			exit(-1);

		}

	}else yyin = stdin;

archivoAuxiliar = open("FLEX_AUX",O_CREAT|O_WRONLY,S_IRUSR|S_IWUSR);

yylex();



printf("---------------------------------------\n");
printf("Lectura sintactica terminada\n");
printf("---------------------------------------\n");

return 0;


}
