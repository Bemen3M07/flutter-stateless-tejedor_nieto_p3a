import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    final int counter = context.select<CounterProvider, int>((p) => p.counter);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(counter.toString(), style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () => context.read<CounterProvider>().increment(),
            child: const Text('Sumar'),
          ),
        ],
      ),
    );
  }
}