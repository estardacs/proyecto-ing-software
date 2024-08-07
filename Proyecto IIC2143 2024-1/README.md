# README PROYECTO DE SOFTWARE

Link de render: https://vuelvecomigoapi.onrender.com/



# Qué es "Vuelve Conmigo"?
Vuelve Conmigo es una página que te permite hacer grupo de personas para volver desde tu universidad hasta un punto en común, como lo puede ser un metro, una calle, una plaza común, etc. y viceversa, para resolver problemas como volver seguro a tu casa, conocer personas, irte con tu grupo de amigos de forma organizada, entre otras ideass que tu tengas.

# Documentación
## Gemas Relevantes
- cloudinary
- geokit-rails
- leaflet-rails
- simplecov
- devise
- bulma
- rubocop
- factory_bot_rails
- activestorage

## API Implementada
Se utilizó una API de mapa para esta web
## Entidades
### User
**Atributos**
- `id` --> ID de la instancia
- `n_tuc` : String --> número de TUC del estudiante, debe tenr 7 digitos
- `email` : String --> correo del estudiante con formato xxx@uc.cl, donde xxx debe ser de largo mayor a 1
- `descripcion` : String --> descripción que desee colocar la persona de si misma, la cual es opcional
- `genero` : String --> genero de la persona, la cual puede ser Hombre, Mujer, Otro
- `nombre_usuario` : String --> es el nombre que elija el usuario para su cuenta, debe tener largo mayor a 1
- `password` : String --> contraseña que elije el estudiante para proteger su cuenta, debe tener largo mayor o igual a 6

**Relaciones**
- Puede tener muchos Posts, Trips, Chats, Messages, Reviews, Notifications

**¿Qué es?**
User es una entidad que almacena y maneja lo referente a los usuarios nuevos y antiguos, como es inicio de sesión, registro y datos de estos

### Post
**Atributos**
- `id` --> ID de la instancia
- `user_id` --> ID de una instancia User
- `vigente` : Boolean --> indica que el post está vigente
- `pref_genero` : String --> Indica si la persona tiene uan preferencia de genero en crocreto para el viaje o vuelta, este puede ser: Hombre, Mujer, Ninguno, Otro
- `fecha` : String --> es la fecha en la cual el usuario desea realizar el viaje
- `hora` : String --> indica la hora en la que se realizará el viaje
- `cupos` : Integer --> cantidad de personas que podrán ir al viaje
- `campus` : String --> campus al cual se llega o se va el grupo de personas
- `auto` : Boolean --> indica si la persona que realiza el post contará con auto para el viaje
- `llegada` : String --> lugar de llegada del viaje
- `salida` : String --> lugar de salida del viaje
- `comuna` :  String --> comuna de llegada del viaje
- `salida_lat` : Float
- `salida_ing` : Float
- `llegada_lat` : Float
- `llegada_ing` : Float

**Relaciones**
- Puede tener muchos Trips, Chats, Reviews

**¿Qué es?**
Post es una entidad que se encarga de almacenar y manejar lo referente a las publicaciones de los viajes de los usuarios

### Trip
**Atributos**
- `id` --> ID de la instancia
- `id_user` --> ID de la instancia User
- `id_post` --> ID de la instancia Post
- `id_chat` --> ID de la instancia Chat

**¿Qué es?**
Trip se refiere a los viajeros, este entidad nos permite relacionar User, con Post y Chat a la vez, y corresponde a la inscripción de un usuario a un Post o viaje.
  
### Chat
**Atributos**
- `id` --> ID de la instancia
- `id_post` --> ID de la instancia Post
    
**Relaciones**
- Puede tener muchos Trips, Messages

**¿Qué es?**
Esta entidad permite manejar todo lo referente al chat, menos crear los mensajes, pero almacena todos los usuarios de forma simple, que se encuentren en el chat, por medio de Post, ya que Post tendrá el creador del Post, más los Trip (viajeros). Por lo que la obtención de datos es más ordenada y sencilla.
  
### Menssage
**Atributos**
- `id` --> ID de la instancia
- `id_user` --> ID de la instancia User
- `id_chat` --> ID de la instancia Chat
- `content` : String --> es el contenido del mensaje del usuario

**¿Qué es?**
Esta entidad permite manejar los mensajes de los usuarios dentro de un chat dado.

### Review
**Atributos**
- `id` --> ID de la instancia
- `reviewer_id` : id_user --> ID de la instancia User, persona que realiza la review
- `reviewed_id` : id_user --> ID de la instancia User, persona a la que se realiza la review
- `rating` : Integer --> calificación que le da un usuario a otro, este puede ser del 1 al 10
- `comentario` : String --> comentario que deja un usuario al hacer una review

**¿Qué es?**
Review permite organizar, guardara y manejar lo concerniente a las reseñas de un usuario o otro.

### Notification
**Atributos**
- `id` --> ID de la instancia
- `message` : String --> mensaje de la notificación
- `read` : Boolean --> indica si la notificación ha sido leida o no
- `id_user` --> ID de la instancia User

**¿Qué es?**
Permite organizar y manejar las distintas notificaciones que podrían tener los usuarios, como puede ser, recibir un nuevo mensaje o cel haber creado un post.
## Controladores

#### Métodos

- Metodo --> Retorno

  
**User**
- Métodos de Device

**Post**
- `index` --> Post de un User
- `new` --> construye un Post
- `show` --> muestra un Post solicitado
- `create` --> crea un Post, Chat, Notification
- `edit` --> muestra un post en específico del usuario
- `update` --> edita un post
- `subscribe` --> suscribe una persona a un Post, crea un Trip y una Notification
- `unscribe` --> desuscribe una persona de un Post, elimina el Trip de la persona que se suscribió al Post
- `destroy` --> elimina un Post con sus Trips, Chat y Messages

**Chat**
- `show` --> muestra un Chat dado
- `index` --> ubica un Chat dado un Post y un Trip
- `create` --> crea un Message

**Message**
- `create` --> crea un Message y una Notification para el mensaje

**Review**
- `index` --> busca una Review
- `new` --> crea una Review vacío
- `create` --> crea una Review y crea una Notification
- `buscar` --> busca una Review
- `edit` --> entrega una Review
- `update` --> edita una Review
- `destroy` --> elimina una Review

**Notification**
- `index` --> entrega una Notification

**Pages**
  - `perfil` --> solo guarda en variables los datos del usuario
  - `edit_perfil` --> entrega un usuario
  - `buscar` --> dependiendo del parámetro para buscar un Post, se entregará un Post dado ese parámetro
  - `posts` --> redirije a la ventana de Post
  - `review` --> redirije a la ventana de Review
  - `update_perfil` --> actualiza la contraseña cel usuario y crea una Notification

> [!NOTE]
> Este controlador permite rediriguir a otras rutas importantes de forma facil, este controlador es relevante ya que es la barra que redirije a distintas vistas importantes para el usuario
 
**Home**
- `index` --> hace nada

## Rutas

  
**Chats**
- `GET`    /chats/new(.:format) --> chats_new 
- `GET`    /chats/index(.:format) --> chats_index
- `GET`    /chats/create(.:format) --> chats_create
- `GET`    /chats/destroy(.:format) --> chats_destroy
- `GET`    /chats(.:format) --> chats
- `GET`    /chats/:id(.:format) --> chat
- `DELETE` /chats/:id(.:format) --> Elimina chat
  
**User**
- `GET`    /users/sign_in(.:format) --> new_user_session
- `POST`   /users/sign_in(.:format) -->  user_session
- `DELETE` /users/sign_out(.:format) --> destroy_user_session
- `GET`    /users/password/new(.:format)  --> new_user_password
- `GET`    /users/password/edit(.:format) --> edit_user_password
- `PATCH`  /users/password(.:format) --> user_password
- `PUT`    /users/password(.:format)
- `POST`   /users/password(.:format)
- `GET`    /users/cancel(.:format) --> cancel_user_registration
- `GET`    /users/sign_up(.:format) --> new_user_registration
- `GET`    /users/edit(.:format)  --> edit_user_registration
- `PATCH`  /users(.:format) --> user_registration
- `PUT`    /users(.:format)
- `DELETE` /users(.:format) --> elimina user
- `POST`   /users(.:format)
- `GET`    /users/sign_out(.:format) --> users_sign_out

**Pages**
- `GET`    /pages/perfil(.:format) --> pages_perfil
- `GET`    /pages/perfil(.:format) --> pages_perfil
- `GET`    /pages/buscar(.:format) --> pages_buscar
- `GET`    /pages/posts(.:format) --> pages_posts
- `GET`    /pages/review(.:format) --> pages_review
- `GET`    /pages/edit_perfil(.:format) --> edit_perfil
- `PATCH`  /pages/perfil(.:format) --> update_perfil

**Reviews**
- `GET`    /reviews/buscar(.:format) --> buscar_reviews
- `GET`    /reviews(.:format) --> reviews
- `POST`   /reviews(.:format)
- `GET`    /reviews/new(.:format) --> new_review
- `POST`   /reviews(.:format)
- `GET`    /reviews/:id/edit(.:format)  --> edit_review
- `PATCH`  /reviews/:id(.:format)  --> review
- `PUT`    /reviews/:id(.:format)
- `DELETE` /reviews/:id(.:format) --> elimina una review
  
**Posts**
- `GET`    /posts(.:format) --> posts --> posts
- `POST`   /posts(.:format)
- `GET`    /posts/new(.:format) --> new_post
- `GET`    /posts/:id/edit(.:format) --> edit_post
- `GET`    /posts/:id(.:format)  --> post
- `PATCH`  /posts/:id(.:format)
- `PUT`    /posts/:id(.:format)
- `DELETE` /posts/:id(.:format) --> elimina un post
- `GET`    /buscar(.:format) ---> buscar_posts
  
**Messages**
- `POST`   /chats/:chat_id/messages(.:format) --> chat_messages

**Notification**
  - `GET`    /notifications/index(.:format) -->  notifications_index
  - `POST`   /notifications/:id/mark_as_read(.:format) --> mark_as_read_notification
  - `GET`    /notifications(.:format) --> notifications
  - `GET`    /notifications(.:format) 
  
**Trip**
- `POST`   /posts/:id/subscribe(.:format) --> subscribe_post
- `DELETE` /posts/:id/unsubscribe(.:format) --> unsubscribe_post

**Otros**
- `GET`    /home/index(.:format)  --> home_index
- `GET`    /tarjeta_usuario/:id(.:format) --> tarjeta_usuario

## Vistas
### Pages
- `buscar.html.erb` --> muestra la página de busqueda de Posts
- `edit_perfil.html.erb` --> muestra la página de edición de perfil del usuario
- `perfil.html.erb` --> muestra el perfil del usuario
- `posts.html.erb` --> muestra la página de post
- `review.html.erb` --> muestra la página de review
- `tarjeta_usuario.html.erb` --> muestra la tarjerta de un usuario
  
### Post
- `edit.html.erb` --> para editar un post
- `index.html.erb` --> para buscar un post
- `new.html.erb` --> para crear un post
- `show.html.erb` --> para mostrar un post

### Reviews
- `buscar.html.erb` --> permite mostrar la pagina de busqueda de una review
- `edit.html.erb` --> permite mostrar la página de edicion de una review
- `index.html.erb` --> permite mostrar una review
- `new.html.erb` --> permite hacer mostrar la página para hacer una review

### Notification
- `index.html.erb` --> permite ver las notifications

### Chat
-`index.html.erb` --> permite buscar un chat
- `new.html.erb` --> permite hacer un mensaje
- `show.html.erb` --> permite mostrar un chat

### Home
- `index.html.erb` --> muestra la pagina home luego de ingresa el usuario

### Devise
- General se hace uso la gema devise para hacer control del incio de sesion del usuario, por lo que las vistas de este se usan para lo que se espera de la gema
- Se usan las vistas de registrations, sessions y algunos links de shared
### Layout
- `_navbar.html.erb` --> contiene la barra de navegación
