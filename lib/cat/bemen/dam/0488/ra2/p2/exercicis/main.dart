import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
import 'stateless_page.dart' as sp;
import 'stateful_page.dart' as sf;

// P3 exercises (stateless) - import with prefixes to avoid name collisions
import '../../p3/exercici1/main_1.dart' as p3_1;
import '../../p3/exercici1/main_2.dart' as p3_2;
import '../../p3/exercici1/main_3.dart' as p3_3;
import '../../p3/exercici1/main_4.dart' as p3_4;
import '../../p3/exercici1/main_5.dart' as p3_5;
import '../../p3/exercici1/main_6.dart' as p3_6;

// P2 exercises (stateful) - these live in the same folder
import 'main_1.dart' as p2_1;
import 'main_2.dart' as p2_2;
import 'main_3.dart' as p2_3;
import 'main_4.dart' as p2_4;
import 'main_5.dart' as p2_5;
import 'main_6.dart' as p2_6;

void main() {
  runApp(const Exercici28App());
}

class Exercici28App extends StatelessWidget {
  const Exercici28App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ex 2.8 - Navegació',
        home: const Exercici28Home(),
      ),
    );
  }
}

class Exercici28Home extends StatelessWidget {
  const Exercici28Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final selected = provider.selectedBottomIndex;

    // Build the lists of factories for each page.
    final p3Factories = <sp.WidgetFactory>[
      () => p3_1.MainApp(),
      () => p3_2.MainApp(),
      () => p3_3.MainApp(),
      () => p3_4.MainApp(),
      () => p3_5.MainApp(),
      () => p3_6.MainApp(),
    ];

    // human-friendly labels for P3 tabs (prefer class/file names)
    final p3Labels = <String>[
      'MainApp (1)',
      'Bienvenida',
      'MainApp (3)',
      'ContactScreen',
      'MainApp (5)',
      'MainApp (6)',
    ];

    final p2Factories = <sf.WidgetFactory>[
      () => p2_1.GoodApp(),
      () => p2_2.Ex22SayHello(),
      () => p2_3.SecretNumberApp(),
      () => p2_4.Ex24DiceRoller(),
      () => p2_5.CounterApp(),
      () => p2_6.Ex26ShoppingListIconsDialog(),
    ];

    // labels for P2 tabs (use the exercise class names)
    final p2Labels = <String>[
      'GoodApp',
      'Ex22SayHello',
      'SecretNumberApp',
      'Ex24DiceRoller',
      'CounterApp',
      'Ex26ShoppingListIconsDialog',
    ];

    final pages = [
      sp.StatelessPage(widgets: p3Factories, labels: p3Labels),
      sf.StatefulPage(widgets: p2Factories, labels: p2Labels),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercici 2.8 — Navegació')),
      body: pages[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: (i) => provider.selectedBottomIndex = i,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'P3 (Stateless)'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'P2 (Stateful)'),
        ],
      ),
    );
  }
}
