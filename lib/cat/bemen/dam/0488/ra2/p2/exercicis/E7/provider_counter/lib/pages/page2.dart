import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

// Página 2: Solo muestra el valor del contador (más grande)
class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final int counter = context.watch<CounterProvider>().counter; // Recibe el valor del contador desde Page1

    return Center(
      child: Text(
        counter.toString(),
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }
}