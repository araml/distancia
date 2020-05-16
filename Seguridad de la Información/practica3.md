# Practica 3

## Ejercicio 1

## Ejercicio 2

## Ejercicio 3 (Wargames.jpeg)

Hay 2 thumbnails embebidos, uno adentro de la primer imagen y otro adentro del
primer thumbnail. Estas imagenes tienen coordenadas GPS.

## Ejercicio 4

## Ejercicio 5

## Ejercicio 6

## Ejercicio 7

## Ejercicio 8

- (No estoy seguro de este) `SecureRandom.hex(32)` devuelve un string de 64bytes (caracteres) en vez de 32
- Solo devuelve el padding `c.final` y no todo el texto encriptado, lo correcto
  seria
    ```ruby
        return c.update(text) + c.final
    ```

https://api.rubyonrails.org/v3.0.9/classes/ActiveSupport/SecureRandom.html#method-c-hex

https://ruby-doc.org/stdlib-2.5.1/libdoc/openssl/rdoc/OpenSSL/Cipher.html#class-OpenSSL::Cipher-label-Encrypting+and+decrypting+some+data
