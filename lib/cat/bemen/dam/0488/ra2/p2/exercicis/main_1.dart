import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp()); // Punto de entrada de la app
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoodApp(), // Pantalla principal
    );
  }
}

class GoodApp extends StatelessWidget {

  final ValueNotifier<String> message = ValueNotifier<String>('Good ?!'); // Variable que cambia el texto

  GoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ValueListenableBuilder<String>( // Escucha cambios en message
          valueListenable: message,
          builder: (context, value, _) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  value,
                  style: const TextStyle(
                      fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () => message.value = 'Good morning', // Cambia el texto
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Morning'),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => message.value = 'Good night', // Cambia el texto
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                  child: const Text('Night'),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
