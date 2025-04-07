
## Descripción

Ejercicios pensados para practicar la creación de bases de datos MySQL.

### Tecnologias usadas

- phpMyAdmin
- SQL

***

## Nivel 1

<br>

EJERCICIO 1:

Una óptica, llamada “Cul d'Ampolla”, quiere informatizar la gestión de los clientes y las ventas de gafas.

En primer lugar, la óptica quiere saber cuál es el proveedor de cada una de las gafas. En concreto, quiere saber de cada proveedor:
- El nombre
- La dirección (calle, número, piso, puerta, ciudad, código postal y país)
- Teléfono
- Fax
- NIF

La política de compras de la óptica se basa en que las gafas de una marca se comprarán a un único proveedor (así podrá obtener mejores precios), pero pueden comprar gafas de varias marcas a un proveedor. De las gafas quiere saber:
- La marca
- La graduación de cada uno de los cristales
- El tipo de montura (flotante, pasta o metálica)
- El color de la montura
- El color de cada cristal
- El precio

De los clientes quiere almacenar:
- El nombre
- La dirección postal
- El teléfono
- El correo electrónico
- La fecha de registro
- Cuando llega un cliente nuevo, almacenar el cliente que le ha recomendado el establecimiento (siempre que alguien le haya recomendado).
- El sistema deberá indicar quién ha sido el empleado que ha vendido cada gafas.

<br>


EJERCICIO 2:

Te han contratado para diseñar una web que permita realizar pedidos de comida a domicilio por Internet.

Toma en cuenta las siguientes indicaciones para modelar cómo sería la base de datos del proyecto:

Para cada cliente se almacena un identificador único:
- Nombre
- Apellidos
- Dirección
- Código postal
- Localidad
- Provincia
- Número de teléfono
Las datos de localidad y provincia estarán almacenados en tablas separadas. Sabemos que una localidad pertenece a una única provincia, y que una provincia puede tener muchas localidades. Para cada localidad se almacena un identificador único y un nombre. Para cada provincia se almacena un identificador único y un nombre.

Una persona puede realizar muchas órdenes, pero una única orden solo puede ser realizada por una única persona. De cada orden se almacena un identificador único:
- Fecha/hora
- Si la orden es para reparto a domicilio o para recoger en tienda
- La cantidad de productos que se han seleccionado de cada tipo
- El precio total

Una orden puede constar de uno o varios productos.

Los productos pueden ser pizzas, hamburguesas y bebidas. De cada producto se almacena un identificador único:
- Nombre
- Descripción
- Imagen
- Precio

En el caso de las pizzas existen diversas categorías que pueden ir cambiando de nombre a lo largo del año. Una pizza solo puede estar dentro de una categoría, pero una categoría puede tener muchas pizzas.

De cada categoría se almacena un identificador único y un nombre. Una orden es gestionada por una única tienda y una tienda puede gestionar muchas órdenes. De cada tienda se almacena un identificador único:
- Dirección
- Código postal
- Localidad
- Provincia

En una tienda pueden trabajar muchos empleados y un empleado solo puede trabajar en una tienda. De cada empleado, se almacena un identificador único:
- Nombre
- Apellidos
- NIF
- Teléfono
- Si trabaja como cocinero o repartidor. Para las órdenes de reparto a domicilio interesa guardar quién es el repartidor que hace la entrega de la orden y la fecha/hora del momento de la entrega

<br>

***


## Nivel 2

<br>

EJERCICIO 1:

Trataremos de hacer un modelo simple de cómo sería la base de datos para una versión reducida de YouTube.

De cada usuario guardamos un identificador único:
- Email
- Contraseña
- Nombre de usuario
- Fecha de nacimiento
- Sexo
- País
- Código postal

Un usuario puede publicar vídeos. De cada vídeo guardamos un identificador único:
- Un título
- Una descripción
- Un tamaño
- El nombre del archivo de vídeo
- Duración del vídeo
- Una miniatura
- El número de reproducciones
- El número de likes
- El número de dislikes

Un vídeo puede tener tres estados diferentes: público, oculto y privado. Un vídeo puede tener muchas etiquetas. Una etiqueta se identifica por un identificador único y un nombre de etiqueta. Interesa guardar quién es el usuario que publica el vídeo y en qué fecha/hora lo hace.

Un usuario puede crear un canal. Un canal tiene un identificador único:
- Un nombre
- Una descripción
- Una fecha de creación

Un usuario puede suscribirse a los canales de otros usuarios. Un usuario puede darle un like o un dislike a un vídeo una única vez. Habrá que llevar un registro de los usuarios que le han dado like y dislike a un determinado vídeo y en qué fecha/hora lo hicieron.

Un usuario puede crear playlists con los vídeos que le gusten. Cada playlist tiene un identificador único:
- Un nombre
- Una fecha de creación
- Un estado que indica que puede ser pública o privada

Un usuario puede escribir comentarios en un vídeo determinado. Cada comentario está identificado por un identificador único:
- El texto del comentario
- La fecha/hora en la cual se realizó

Un usuario puede marcar un comentario como me gusta o no me gusta. Habrá que llevar un registro de los usuarios que han marcado un comentario como me gusta/no me gusta, y en qué fecha/hora lo hicieron.

<br>

***

## Nivel 3

<br>

EJERCICIO 1:

Trataremos de hacer un modelo simple de cómo sería la base de datos necesaria para Spotify.

Existen dos tipos de usuarios: free y premium. De cada usuario guardamos un identificador único:
- Email
- Contraseña
- Nombre de usuario
- Fecha de nacimiento
- Sexo
- País
- Código postal

Los usuarios premium tienen suscripciones. Las datos necesarios que debemos guardar para cada suscripción son:
- Fecha de inicio de la suscripción
- Fecha de renovación del servicio
- Una forma de pago, que puede ser mediante tarjeta de crédito o PayPal

De las tarjetas de crédito guardamos el número de tarjeta, mes y año de caducidad y el código de seguridad. De los usuarios que pagan con PayPal guardamos el nombre de usuario de PayPal. Nos interesa llevar un registro de todos los pagamentos que un usuario premium ha realizado durante el período que está subscrito. De cada pago se guarda:
- La fecha
- Un número de orden (que es único)
- Un total

Un usuario puede crear muchas playlists. De cada playlist guardamos:
- Un título
- El número de canciones que contiene
- Un identificador único
- Una fecha de creación

Cuando un usuario elimina una playlist no se borra del sistema, sino que se marca como que ha sido eliminada. De esta manera el usuario puede recuperar sus playlists en caso de que las haya eliminado por error. Es necesario almacenar la fecha en la cual la playlist ha sido marcada como eliminada.

Podemos decir que existen dos tipos de playlists: activas y eliminadas. Una playlist que está activa puede ser compartida con otros usuarios, esto significa que otros usuarios pueden añadir canciones en ella. En una lista compartida nos interesa saber qué usuario ha sido el que ha añadido cada canción y en qué fecha lo hizo.

Una canción solo puede pertenecer a un único álbum. Un álbum puede contener muchas canciones. Un álbum ha sido publicado por un único artista. Un artista puede haber publicado muchos álbums. De cada canción guardamos un identificador único:
- Un título
- Una duración
- El número de veces que ha sido reproducida por los usuarios de Spotify

De cada álbum guardamos un identificador único:
- Título
- Año de publicación
- Una imagen con la portada

De cada artista guardamos un identificador único:
- Nombre
- Una imagen del artista

Un usuario puede seguir a muchos artistas. Un artista puede estar relacionado con otros artistas que hacen música similar, de manera que Spotify pueda mostrarnos una lista de artistas relacionados con los artistas que nos gustan. También nos interesa guardar cuáles son los álbumes y las canciones favoritas de un usuario. Un usuario puede seleccionar muchos álbumes y muchas canciones como favoritas.

NOTA: Una vez creadas las bases de datos, llenaremos las tablas con datos de prueba para verificar que las relaciones son correctas.

<br>


***


## Cómo ejecutarlo
Clona el repositorio o descarga el archivo zip, luego ábrelo en tu entorno de desarrollo integrado (IDE) preferido.
