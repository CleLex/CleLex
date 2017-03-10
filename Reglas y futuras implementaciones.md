
Para añadir nuevas reglas al modulo lexico ( .l ): 

		->Si es necesario añadir un nuevo contexto (debido a que la regla puede interferir con otras generales)
	el nuevo contexto tendra un nombre descriptivo de la funcion de las reglas que incluyen.
           		
		Las nuevas reglas se añadiran al final de la zona de reglas ( Por debajo de todas las demas ) y se hara en 
	forma de bloque al igual que el resto.

Para cambiar las funciones auxiliares ( .c ):

		1º Modificar la parte deseada.
		2º Comentarla empezando dicho comentario con //CAMBIO_HACKATON "Resto de comentario"
		3º Comprobar que la funcionalidad es correcta usando tests
		4º Abrir siempre el fichero final para ver si hay alguna incidencia


*Funcionalidades principales a añadir*

-> Hacer test para comprobar el correcto funcionamiento del programa (Tanto en C como en C++)
-> Ejecutar el script desde cualquier directorio sin tenerlo en el mismo ( Como un comando )
-> El nombre del ficero de salida debe ser igual que el de entrada
-> Arreglar el problema del /00 (En el fichero final. Probablemente se deba a la funcion tabulacion)
-> Añadir la opcion de una tabulacion base ( Clelex NombreDeFichero 5 ) <- De esa forma se añadirian 5 espacios como tabulacion base
-> Añadir la opcion de crear un nuevo documento de salida en vez de sustituir al existente. 
-> Añadir la opcion de elegir el nombre del fichero de salida.
-> Documentar y crear la pagina web del programa en github


*Funcionalidades secundarias*

-> Dar soporte para otros lenguajes

	*Para ello se debere crear un nuevo modulo .l en el que se crearan nuevas reglas para este lenguaje.



			
