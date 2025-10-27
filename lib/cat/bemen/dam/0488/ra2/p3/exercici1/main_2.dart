import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: WelcomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Welcome!',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Start learning now!',
              style: TextStyle(
                fontSize: 16,
                color: Color.fromARGB(137, 0, 0, 0),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: const StadiumBorder(),
                minimumSize: const Size(100, 40),
              ),

              
              child: const Text('Login'),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {},
              
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: const StadiumBorder(),
                minimumSize: const Size(110, 40),
              ),
            
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}

