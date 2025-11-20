import 'package:flutter/material.dart';
import 'package:provider_counter/screens/home_screen.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';



void main() {
runApp(ChangeNotifierProvider( // Provider global para el contador
  create: (_) => CounterProvider(), // Crea la instancia del contador
  child: const MyApp(), ));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Provider Counter', // App del contador con provider
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: const HomeScreen(), // Pantalla principal con navegación
    );
  }
}
