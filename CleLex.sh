#!/bin/sh


flex Funcionalidades/Clear.l
gcc lex.yy.c -o limpiador -lfl
./limpiador $1

gcc Funcionalidades/eliminarEspaciosDobles.c -o espacios
./espacios FLEX_AUX

rm FLEX_AUX

gcc Funcionalidades/tabulador.c -o tabulacion
./tabulacion FLEX_AUX_INTERMEDIO_2


rm FLEX_AUX_INTERMEDIO
rm FLEX_AUX_INTERMEDIO_2
rm espacios
rm tabulacion
rm lex.yy.c
rm limpiador

gedit FLEX_SALIDA_TABULADOR.cpp



