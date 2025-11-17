import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SecretNumberApp(),
    );
  }
}

class SecretNumberApp extends StatefulWidget {
  @override
  _SecretNumberAppState createState() => _SecretNumberAppState();
}

class _SecretNumberAppState extends State<SecretNumberApp> {
  final TextEditingController _controller = TextEditingController();
  final int _secretNumber = Random().nextInt(101); 
  int _intents = 0;
  String _message = '';

  void _checkNumber() {
    final input = _controller.text.trim();
    if (input.isEmpty) return;

    final guess = int.tryParse(input);
    if (guess == null || guess < 0 || guess > 100) {
      setState(() {
        _message = 'Introdueix un número entre 0 i 100';
      });
      return;
    }

    setState(() {
      _intents++;
      if (guess < _secretNumber) {
        _message = 'El número que busques és més gran';
      } else if (guess > _secretNumber) {
        _message = 'El número que busques és més petit';
      } else {
        _message = 'Has encertat!';
      }
    });
  }

  void _resetGame() {
    setState(() {
      _controller.clear();
      _message = '';
      _intents = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                'Endevina el número secret',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _controller,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Escriu un número entre 0 i 100',
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                onPressed: _checkNumber,
                style: ElevatedButton.styleFrom(
                  shape: const StadiumBorder(),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                ),
                child: const Text('Validar'),
              ),
              const SizedBox(height: 16),
              Text(
                'Intents: $_intents',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 8),
              Text(
                _message,
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: _message == 'Has encertat!'
                      ? Colors.green
                      : Colors.black87,
                ),
              ),
              if (_message == 'Has encertat!') ...[
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => SecretNumberApp()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.blueGrey,
                  ),
                  child: const Text('Jugar de nou'),
                ),
              ]
            ],
          ),
        ),
      ),
    );
  }
}
