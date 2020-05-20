# Practica 3

## Ejercicio 1

## Ejercicio 2

## Ejercicio 3 (Wargames.jpeg)

Hay 2 thumbnails embebidos, uno adentro de la primer imagen y otro adentro del
primer thumbnail. Estas imagenes tienen coordenadas GPS.

## Ejercicio 4

Nos piden hacer todos los comandos a mano, pero primero podemos verificar que
sea realmente válido, para esto podemos usar el comando smime y pasarle como
argumento -verify

`openssl smime -verify -in <mail>`

Esto lamentablemente nos da como resultado

`error: certificate has expired`

Usando -startdate y -enddate en el certificado firmador vemos que

`openssl x509 -startdate -enddate -noout -in <firmador>`

devuelve

`<Down>notBefore=Apr 15 00:00:00 2015 GMT
notAfter=Apr 14 23:59:59 2016 GMT`

Por obvias razones esto ya expiro. Por otro lado si corremos el mismo comando de
smime pero con -no_check_time vemos que si pasa el checkeo, es decir que por lo
menos la cadena de firmas es correcta.

Entonces queremos ver que la cadena de firmas y el contenido del mail es
autentico, para esto tenemos que hacer lo siguiente

- Confirmar que la clave pública del firmante es validad por las autoridades
  certificantes
- Obtener la clave pública del firmante
- Desencriptar el hash y compararlo con el hash que se computa del texto plano
- Verificar que ninguno de los certificados esté vencido (Ya vimos que si lo
  estan)

Para obtener la clave pública del firmante usamos el siguiente comando de
OpenSSL

`openssl x509 -pubkey -in <certificado_firmante.crt> -out public_key.key`

Por otro lado obtenemos el p7s del mail

`openssl smime pk7out -in <mail> -text -out pkcs7.p7s`

Y con esto podemos ver toda la cadena de certificados

`openssl pkcs7 -in pkcs7.p7s -print_certs -text -out certs.pem`

Adentro de certs.pem podemos buscar el hash (encriptado por el firmante) como
también los otros hashes encriptados que verifican la cadena de firmas.

Podemos explorar el pkcs7 con asn1parse

`openssl asn1parse -in pkcs7.out`

Y aca ver donde estan las firmas encriptadas.

Para obtener el mensaje del mail podemos usar el comando verify de smime
pero pasarle que no verifique, esto devuelve el texto plano del cuerpo a hashear

`openssl smime -verify -in <mail> -noverify -out mail_body.txt`

Una vez que tenemos la firma, la clave pública y el contenido del mail tenemos
que verificar que coincidan, para eso desencriptamos usando la clave pública y
el mensaje encriptado.

`openssl rsault -verify -inkey public_key.key -in <encrypted_msg.bin> -pubin >
decrypted_msg.bin`

Una vez desencriptado lo podemos inspeccionar con asn1parse

`openssl asn1parse -inform -der -in decrypted_msg.bin`

Da un output de la forma

```
    0:d=0  hl=2 l=  33 cons: SEQUENCE
    2:d=1  hl=2 l=   9 cons: SEQUENCE
    4:d=2  hl=2 l=   5 prim: OBJECT            :sha1
   11:d=2  hl=2 l=   0 prim: NULL
   13:d=1  hl=2 l=  20 prim: OCTET STRING      [HEX DUMP]:9EDFCD2B397D9305A172549313FDBA65CECA0742
```

El hex dump es el hash del contenido, por otro lado nos dice que uso SHA1 para
hashear.

Asi que tenemos que hashear los contenidos del texto con sha1, para esto vamos a
usar el comando dgst

`openssl dgst -sha1 mail_body.txt`

Y comparar el output de este mensaje con el de [HEX DUMP]

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
