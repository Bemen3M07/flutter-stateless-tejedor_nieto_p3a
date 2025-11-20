import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
import 'pages/stateless_page.dart';
import 'pages/stateful_page.dart';

// P3 exercises (stateless)
import '../../p3/exercici1/main_1.dart' as p3_1;
import '../../p3/exercici1/main_2.dart' as p3_2;
import '../../p3/exercici1/main_3.dart' as p3_3;
import '../../p3/exercici1/main_4.dart' as p3_4;
import '../../p3/exercici1/main_5.dart' as p3_5;
import '../../p3/exercici1/main_6.dart' as p3_6;

// P2 exercises (stateful)
import 'main_1.dart' as p2_1;
import 'main_2.dart' as p2_2;
import 'main_3.dart' as p2_3;
import 'main_4.dart' as p2_4;
import 'main_5.dart' as p2_5;
import 'main_6.dart' as p2_6;

void main() {
  runApp(const Exercici8App());
}

class Exercici8App extends StatelessWidget {
  const Exercici8App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Exercici8Home(),
      ),
    );
  }
}

class Exercici8Home extends StatelessWidget {
  const Exercici8Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final selected = provider.selectedBottom;

    // P3 widgets factories
    final p3Widgets = <WidgetFactory>[
      () => p3_1.MainApp(),
      () => p3_2.MainApp(),
      () => p3_3.MainApp(),
      () => p3_4.MainApp(),
      () => p3_5.MainApp(),
      () => p3_6.MainApp(),
    ];

    // P2 widgets factories
    final p2Widgets = <WidgetFactory>[
      () => p2_1.GoodApp(),
      () => p2_2.Ex22SayHello(),
      () => p2_3.SecretNumberApp(),
      () => p2_4.Ex24DiceRoller(),
      () => p2_5.CounterApp(),
      () => p2_6.Ex26ShoppingListIconsDialog(),
    ];

    final pages = [
      StatelessPage(widgets: p3Widgets),
      StatefulPage(widgets: p2Widgets),
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercici 2.8 — Navegació"),
      ),
      body: pages[selected],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected,
        onTap: provider.setBottom,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.layers),
            label: "P3 (Stateless)",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "P2 (Stateful)",
          ),
        ],
      ),
    );
  }
}