[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

A new Flutter project.
[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

A new Flutter project.

//EJERCICIOS P3

// Exercici 1.1 - Hello World

En aquest exercici he fet una aplicació molt senzilla per mostrar el text “Hello world” a la pantalla.
He fet servir la classe StatelessWidget perquè l’aplicació no necessita cap canvi d’estat, només mostrar un text fix.

He creat un widget principal anomenat MainApp, que retorna un MaterialApp amb un Scaffold.
Dins del Scaffold hi he posat el widget Center, i a dins el Text("Hello world!").

He fet servir Center perquè el text quedés centrat a la pantalla tant verticalment com horitzontalment, i he afegit Text per mostrar el missatge.

Ho he fet així perquè és la manera més senzilla de crear una interfície bàsica en Flutter i, a més, és el primer pas per entendre com es construeix un arbre de widgets.

Widgets utilitzats:

MaterialApp: defineix l’aplicació amb el disseny Material Design.
Scaffold: proporciona l’estructura principal (cos, app bar, etc.).
Center: centra el contingut dins la pantalla.
Text: mostra el text principal.


// Ejercicio 1.2 - Welcome

En el ejercicio 2 lo que he hecho primero es crear un Widget para poder poner el mensaje de bienvenida y los botones, creo una columna con el texto Welcome dani para darle un toque unico y con un estilo lo mas parecido al de la imagen, ahora, una sizedbox para poner el texto de start learning now con un estilo lo mas parecido al original. 
Aqui tambien he creado un par de sizedbox para poner los botones de login y register.

Para poder poner los botones he creado una clase llamada Botones con un widged donde he especificado los detalles del mismo, que sea con color backgroud negro.


// Exercici 1.3 - Resource

En aquest exercici he fet una aplicació que mostra una imatge desada dins dels recursos (assets) i un text explicatiu a sota.

He creat la carpeta assets/ i hi he afegit una imatge (logo.png).
Després, l’he registrat al fitxer pubspec.yaml perquè Flutter la pugui trobar.

A l’aplicació he fet servir una estructura Column dins de Center, per poder posar un element sobre l’altre (imatge i text).
A la part superior hi he posat el Image.asset(), que mostra la imatge local, i a sota un Text() amb una descripció.

He afegit també un SizedBox per deixar espai entre la imatge i el text.
Ho he fet així perquè volia que quedés visualment equilibrat i fàcil de llegir.

Widgets utilitzats:

Image.asset: per mostrar una imatge local.
Column: per col·locar elements en vertical.
SizedBox: per afegir espai entre elements.
Text: per mostrar el missatge explicatiu.
Center: per centrar tota la columna.
AppBar: per afegir un títol superior.


// Ejercicio 1.4 - Contact

En este ejercicio he creado la clase Contact como se nos pide con el nombre completo, email y telefono, tambien el constructor en el que sea obligatorio el nombre, email y telefono.

Ahora pasamos a la app donde creamos un Widget donde crearemos nuestro contacto de Marta 
Ahora nos vamos a la clase de ContactScreen donde la usaremos para definir donde estará ubicado el texto y la imagen, en el centro en este caso, el tamaño de la caja del texto, la altura y diferentes decoraciones. 

Por último la clase contactdetails podemos añadir los iconos del telefono y el correo.


// Exercici 1.5 — Message List

En aquest exercici he fet una aplicació que mostra una llista de missatges amb scroll infinit i un botó flotant (sense funcionalitat).

He creat una classe Message amb dos atributs: author i body.
A partir d’això, he generat una llista de 100 missatges aleatoris fent servir la funció List.generate() i la llibreria dart:math per obtenir noms aleatoris.

Per mostrar-los, he fet servir ListView.builder(), que permet crear llistes llargues de manera eficient, només carregant els elements visibles a la pantalla.
Cada element de la llista és un ListTile, on mostro el nom de l’autor (title) i el text del missatge (subtitle), i un CircleAvatar amb la inicial de l’autor com a icona.

A més, he afegit un FloatingActionButton a la part inferior dreta, tal com demanava l’enunciat.
Tot el disseny l’he fet dins d’un Scaffold amb un AppBar per tenir una estructura neta i organitzada.

He fet servir aquests widgets perquè permeten construir una interfície amb rodetes de missatges (scroll) sense necessitat d’usar estructures complexes o codi amb estat (stateful).

Widgets utilitzats:

ListView.builder: per crear una llista amb scroll infinit.
ListTile: per mostrar cada missatge amb autor i cos.
CircleAvatar: per mostrar la inicial de l’autor dins d’un cercle.
FloatingActionButton: per afegir el botó flotant.
Scaffold i AppBar: per estructurar l’aplicació.


// Ejercicio 1.6 - App Bar

En este ejercicio aprovechamos el ejercicio 5 la gran mayoria de contenido, lo unico que hemos añadido es el bottomNavigationbar que le hemos llamado bottomappbar para abreviar 
le hemos hado shape: const CircularNotchedRectangle(), forma de rectangulo con un hueco circular en el centro para poder poner un boton en medio basicamente.
hemos hecho un children donde hemos metido 4 iconos tipicos de telefono como el de la casita, buscador, mensaje y la tuerca de settings. 



// EJERCICIOS P2

// Ejercicio 2.1 – Good Morning

En este ejercicio he creado una aplicación muy sencilla donde muestro un texto que al principio dice “Good ?!”. Lo que he hecho es añadir dos botones: uno que cambia el texto a “Good morning” y otro que lo cambia a “Good night”.
Para poder hacer que el texto cambie cuando aprieto los botones he utilizado un ValueNotifier con un ValueListenableBuilder, que básicamente escucha los cambios y actualiza la pantalla automáticamente.
Es un ejercicio pensado para empezar a entender cómo funciona el estado en Flutter y cómo podemos hacer que algo se actualice sin tener que recargar todo.


// Ejercicio 2.2 – Say Hello

En este ejercicio he hecho una pantalla de bienvenida con un título y dos botones: “Login” y “Register”.
He creado un widget propio llamado Botones para no repetir código en cada botón y mantener la interfaz más ordenada.
Aunque este ejercicio no tiene estado como tal, sirve para practicar cómo organizar widgets, cómo reutilizar componentes y cómo preparar pantallas con un diseño más limpio.


// Ejercicio 2.3 – Secret Number

En este ejercicio he hecho un pequeño juego donde el usuario tiene que adivinar un número secreto entre 0 y 100. Lo primero que he hecho ha sido generar el número de forma aleatoria. Luego he añadido un TextField donde el usuario puede escribir su número.
Cada vez que se pulsa el botón de validar, compruebo si el número introducido es mayor, menor o si ha acertado. También llevo un contador de intentos que se incrementa cada vez que se comprueba un número.
Este ejercicio sirve para entender mejor cómo trabajar con StatefulWidget, cómo manejar textos, validaciones y cómo actualizar varios datos en pantalla.


// Ejercicio 2.4 – Dice Roller

Aquí he creado una aplicación que simula el lanzamiento de dos dados. He utilizado imágenes SVG para representar las caras del dado.
Lo que he hecho es generar dos números aleatorios del 1 al 6, y con eso cambiar la imagen del dado izquierdo y derecho.
Además, si los dos números salen 6, muestro un “JACKPOT!” con un SnackBar.
Este ejercicio sirve para practicar la carga de recursos, cómo trabajar con imágenes dinámicas, cómo usar SVG y cómo gestionar el estado para actualizar la interfaz.


// Ejercicio 2.5 – Counter

En este ejercicio he hecho un marcador de dos equipos. He añadido dos variables de estado: una para el equipo A y otra para el equipo B.
También he creado tres botones: uno para sumar puntos al equipo A, otro para sumar puntos al equipo B y un botón de reiniciar que pone ambas puntuaciones a cero.
El ejercicio sirve para entender la gestión de estado básica, cómo actualizar valores numéricos y cómo organizar botones y texto en filas y columnas.


// Ejercicio 2.6 – Lista infinita

En este ejercicio he generado una lista de contactos falsa usando nombres aleatorios y un texto genérico.
La idea es tener una lista larga que se pueda scrollear sin problemas, así que he utilizado ListView.builder, que solo dibuja los elementos visibles y ahorra rendimiento.
Aquí también he añadido un botón flotante y una estructura de ListTile para mostrar avatar, nombre y mensaje.
Este ejercicio sirve para practicar listas grandes y la eficiencia en Flutter.


// Ejercicio 2.7 – Provider Counter

En este ejercicio he usado Provider para separar la lógica del contador del UI. Lo que he hecho es crear una clase CounterProvider que guarda un número y notifica a la interfaz cuando cambia. Luego he envuelto la aplicación en un ChangeNotifierProvider, que permite que cualquier widget de la app pueda acceder al contador.
La pantalla principal muestra el número y botones para incrementarlo.
Este ejercicio sirve para aprender cómo funciona el estado global y cómo usar Provider correctamente, que es lo que pide el enunciado.


// Ejercicio 2.8 – Navegación (P2 + P3)

En este ejercicio he creado una aplicación completa que junta todos los ejercicios anteriores dentro de una sola app. La idea es tener un menú inferior para elegir entre los ejercicios de P3 (stateless) y los ejercicios de P2 (stateful).
Una vez seleccionado el grupo, arriba hay un menú TabBar donde cada pestaña representa un ejercicio concreto. Para no romper el código original de los ejercicios, cada pestaña solo muestra un botón que dice “Obrir exercici”, y al pulsarlo se abre ese ejercicio tal como lo programé originalmente.
La aplicación principal usa un NavigationProvider para guardar qué sección está seleccionada. De esta manera, cuando cambio de pestaña o de grupo, la app se actualiza sola.
Este ejercicio agrupa todo lo aprendido: navegación, provider, manejo de tabs y reutilización de widgets.


// EXTRES P2

// stateless_page.dart

En esta página he preparado un TabBar donde cada pestaña corresponde a un ejercicio de P3.
El TabBar se genera de forma dinámica según la lista que recibe la página. Debajo del TabBar, cada pestaña contiene un botón que permite abrir el ejercicio mediante Navigator.push().
No he incrustado directamente los ejercicios porque ellos están hechos con su propio MaterialApp, así que lo más limpio es abrirlos en pantalla nueva.


// stateful_page.dart

Esta página funciona igual que la página de stateless, pero con los ejercicios de P2.
Tiene su propio TabBar y debajo de cada pestaña también hay un botón para abrir el ejercicio correspondiente.
Esto permite tener todos los ejercicios ordenados en un mismo sitio sin necesidad de reescribirlos.


// navigation_provider.dart

Aquí es donde guardo la información de navegación global, como qué pestaña inferior está seleccionada.
Uso un ChangeNotifier muy simple que guarda un número y llama a notifyListeners() cuando se cambia.
Esto hace que la pantalla principal se actualice automáticamente cuando selecciono P2 o P3 en el menú inferior.
