import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_counter/providers/counter_provider.dart';

class Page2 extends StatelessWidget {
  const Page2({super.key});

  @override
  Widget build(BuildContext context) {
    final int counter = context.watch<CounterProvider>().counter;

    return Center(
      child: Text(
        counter.toString(),
        style: const TextStyle(fontSize: 64, fontWeight: FontWeight.bold),
      ),
    );
  }
}