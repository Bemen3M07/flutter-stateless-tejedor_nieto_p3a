import 'package:flutter/material.dart';

void main() => runApp(const MainApp());

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Bienvenida(),
    );
  }
}

class Bienvenida extends StatelessWidget {
  const Bienvenida({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFF7F7F7),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Welcome Dani!',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 8),
            Text(
              'Start learning now',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
            SizedBox(height: 30),
            Botones(text: 'Login'),
            SizedBox(height: 15),
            Botones(text: 'Register'),
          ],
        ),
      ),
    );
  }
}

class Botones extends StatelessWidget {
  final String text;
  const Botones({required this.text});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: null, 
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        shape: const StadiumBorder(),
        minimumSize: const Size(110, 40),
      ),
      child: Text(text),
    );
  }
}

