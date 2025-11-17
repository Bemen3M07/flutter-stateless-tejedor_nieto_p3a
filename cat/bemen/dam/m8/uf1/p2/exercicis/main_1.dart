import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: GoodApp(),
    );
  }
}

class GoodApp extends StatelessWidget {

  final ValueNotifier<String> message = ValueNotifier<String>('Good ?!');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ValueListenableBuilder<String>(
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
                  onPressed: () => message.value = 'Good morning',
                  child: const Text('Morning'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () => message.value = 'Good night',
                  child: const Text('Night'),
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
