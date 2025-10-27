import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hola mundo, soy Dani Nieto!'),
        ),
      ),
    );
  }
}

// Este ejercicio no hay que comentar mucho, es el main.dart que viene por defecto
// y simplemente lo hemos movido a la ruta que nos han pedido.