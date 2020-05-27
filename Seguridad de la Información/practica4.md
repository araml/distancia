# Practica 4

## Ejercicio 3

Nos piden descifrar un archivo .doc cifrado con john the ripper, para esto
usamos `zip2john` para obtener un hash que john the ripper pueda entender y
luego corremos john sobre el hash este

`zip2john input.doc > hash`

`john-the-ripper hash`

