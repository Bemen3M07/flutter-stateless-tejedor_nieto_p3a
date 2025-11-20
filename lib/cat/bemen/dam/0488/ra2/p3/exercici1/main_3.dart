import 'package:flutter/material.dart';

void main() => runApp(const MainApp()); // App con imagen y texto

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset( // Imagen desde assets
                'assets/bymax.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),
// En este ejercicio hemos seguido el mismo formato que en el anterior.
//hemos tenido que cambiar el pubspec.yaml para poder añadir las imagenes 
              const Text(
                "Hola! soy Dani Nieto",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.blueGrey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
