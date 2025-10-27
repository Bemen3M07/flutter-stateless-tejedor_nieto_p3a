[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

A new Flutter project.
[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/XRrsqZ_g)
# empty

A new Flutter project.

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
