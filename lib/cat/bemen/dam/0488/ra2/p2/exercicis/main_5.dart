import 'package:flutter/material.dart';

void main() {
  runApp(MyApp()); // App del marcador de equipos
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CounterApp(), // Pantalla del marcador
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int scoreA = 0; // Puntos equipo A
  int scoreB = 0; // Puntos equipo B

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  '$scoreA',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                Text(
                  '$scoreB',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scoreA++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                  ),
                  child: const Text('Puntuar A'),
                ),
                                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scoreA = 0;
                      scoreB = 0;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                  ),
                  child: const Text('Resetear Puntuación'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      scoreB++;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 30, vertical: 14),
                  ),
                  child: const Text('Puntuar B'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
