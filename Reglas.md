
Para a�adir nuevas reglas al modulo lexico ( .l ): 

		->Si es necesario a�adir un nuevo contexto (debido a que la regla puede interferir con otras generales)
	el nuevo contexto tendra un nombre descriptivo de la funcion de las reglas que incluyen.
           		
		Las nuevas reglas se a�adiran al final de la zona de reglas ( Por debajo de todas las demas ) y se hara en 
	forma de bloque al igual que el resto.

Para cambiar las funciones auxiliares ( .c ):

		1� Modificar la parte deseada.
		2� Comentarla empezando dicho comentario con //CAMBIO_HACKATON "Resto de comentario"
		3� Comprobar que la funcionalidad es correcta usando tests
		4� Abrir siempre el fichero final para ver si hay alguna incidencia


*Funcionalidades principales a a�adir*

-> Hacer test para comprobar el correcto funcionamiento del programa (Tanto en C como en C++)
-> Ejecutar el script desde cualquier directorio sin tenerlo en el mismo ( Como un comando )
-> El nombre del ficero de salida debe ser igual que el de entrada
-> Arreglar el problema del /00 (En el fichero final. Probablemente se deba a la funcion tabulacion)
-> A�adir la opcion de una tabulacion base ( Clelex NombreDeFichero 5 ) <- De esa forma se a�adirian 5 espacios como tabulacion base
-> A�adir la opcion de crear un nuevo documento de salida en vez de sustituir al existente. 
-> A�adir la opcion de elegir el nombre del fichero de salida.
-> Documentar y crear la pagina web del programa en github


*Funcionalidades secundarias*

-> Dar soporte para otros lenguajes

	*Para ello se debere crear un nuevo modulo .l en el que se crearan nuevas reglas para este lenguaje.



			