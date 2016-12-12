#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<stdio.h>
#include<errno.h>
#include<string.h>
#include<unistd.h>

void aplicarTabulacion(char* aux, int anidamiento){

  for(int i = 0; i < anidamiento; i++){

    aux[i] = ' ';

  }


}


void tabular(int archivoEntrada, int archivoSalida){

int anidamiento = 0;
int aplicado = 1;
char caracter;
char anterior;


//quitar espacios al comienzo de la linea
while(read(archivoEntrada,&anterior,1) > 0){

  if(anterior != '\n'){

      if(anterior == '{'){


        if(anidamiento > 0){

          char aux1[anidamiento];
          aplicarTabulacion(aux1,anidamiento);
          write(archivoSalida,aux1,anidamiento);
          write(archivoSalida,&anterior,1);

        }else{

          write(archivoSalida,&anterior,1);

        }

        anidamiento++;

      }else if(anterior == '}'){

        anidamiento--;

        if(anidamiento > 0){

          char aux2[anidamiento];
          aplicarTabulacion(aux2,anidamiento);
          write(archivoSalida,aux2,anidamiento);
          write(archivoSalida,&anterior,1);

        }else{

          write(archivoSalida,&anterior,1);

        }

      }else{

        if(anidamiento > 0 && aplicado){

          char aux3[anidamiento];
          aplicarTabulacion(aux3,anidamiento);
          write(archivoSalida,aux3,anidamiento);
          write(archivoSalida,&anterior,1);
          aplicado = 0;

        }else{

          write(archivoSalida,&anterior,1);

        }


      }

    }else{

      write(archivoSalida,&anterior,1);
      aplicado = 1;
    }
  }
}



int main(int argc, char* argv[]){

  int archivoEntrada;
  int archivoSalida;

  //Abro el archivo de entrada con permisos de lectura y escritura
  if((archivoEntrada = open(argv[1],O_CREAT|O_RDWR,S_IRUSR|S_IWUSR)) < 0){

    printf("Error al abrir el archivo de entrada\n");

  }

  if((archivoSalida = open("FLEX_SALIDA_TABULADOR.cpp",O_CREAT|O_WRONLY,S_IRUSR|S_IWUSR)) < 0){

    printf("Error al crear el archivo de salida\n");

  }

  tabular(archivoEntrada,archivoSalida);

  //Todos necesitamos dormir en algun momento
  sleep(1);

  printf("---------------------------------------\n");
  printf("Tabulaciones añadidas\n");
  printf("---------------------------------------\n");

}
