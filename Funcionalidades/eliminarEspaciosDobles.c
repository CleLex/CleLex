#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdio.h>
#include<errno.h>
#include<string.h>
#include <unistd.h>


void elimianarEspaciosDobles(int archivoEntrada,int archivoSalida){


char anterior;
char aux;

//Leer hasta encontrar fin de linea Pierdo el primer caracter de cada linea???
while(read(archivoEntrada,&aux,1) > 0){

    if(aux == ' '){

      if(anterior != ' '){

        write(archivoSalida,&aux,1);

      }

      anterior = aux;

    }else{

      write(archivoSalida,&aux,1);
      anterior = aux;

    }
  }

}

void elimianrEspaciosDelPrincipio(int archivoEntrada, int archivoSalida){

char caracter;
char anterior;
int principio = 1;

while(read(archivoEntrada,&caracter,1) > 0){

if(caracter == ' ' && principio){

  // No hacer nada

}else{

  principio = 0;
  write(archivoSalida,&caracter,1);
  if(caracter == '\n') principio = 1;

}



}


}

int main(int argc, char* argv[]){

int archivoEntrada,archivoSalida;

archivoEntrada = open(argv[1],O_CREAT|O_RDWR,S_IRUSR|S_IWUSR);
archivoSalida = open("FLEX_AUX_INTERMEDIO",O_CREAT|O_WRONLY,S_IRUSR|S_IWUSR);

elimianarEspaciosDobles(archivoEntrada,archivoSalida);

close(archivoEntrada);
close(archivoSalida);

archivoEntrada = open("FLEX_AUX_INTERMEDIO",O_CREAT|O_RDWR,S_IRUSR|S_IWUSR);
archivoSalida = open("FLEX_AUX_INTERMEDIO_2",O_CREAT|O_WRONLY,S_IRUSR|S_IWUSR);

elimianrEspaciosDelPrincipio(archivoEntrada,archivoSalida);

sleep(1);

printf("---------------------------------------\n");
printf("Espacios dobles eliminados\n");
printf("---------------------------------------\n");

return 0;
}
