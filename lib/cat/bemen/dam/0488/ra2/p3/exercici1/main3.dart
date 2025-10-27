import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Exercici 1.3 - Resource"),
          centerTitle: true,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Imatge local del directori assets
              Image.asset(
                'assets/bymax.jpg',
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),

              const SizedBox(height: 20),

              // Text explicatiu
              const Text(
                "Aquesta imatge s'ha carregat des dels recursos (assets)",
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