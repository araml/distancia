# Practica 4

## Ejercicio 3

Nos piden descifrar un archivo .doc cifrado con john the ripper, para esto
usamos `zip2john` para obtener un hash que john the ripper pueda entender y
luego corremos john sobre el hash este

`zip2john input.doc > hash`

`john-the-ripper hash`

jtr encontró este password bastante rápido, si nos fijamos en el output vemos
que carga usa un algoritmo para passwords del Office 2003

`Loaded 1 password hash (oldoffice, MS Office <= 2003 [MD5/SHA1 RC4 32/64])`

A partir del 2003 además de este algoritmo se agregó la opción de usar un
algoritmo custom de protección.

Post 2007 se empezó a usar AES-128 (y más arriba) con SHA1 para guardar la
password lo cual hace que un ataque de este tipo no funcione.
