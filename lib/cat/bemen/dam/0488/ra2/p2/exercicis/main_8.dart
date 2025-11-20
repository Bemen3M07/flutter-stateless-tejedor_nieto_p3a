import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
import 'pages/stateless_page.dart';
import 'pages/stateful_page.dart';

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

    final pages = [
      const StatelessPage(),
      const StatefulPage(),
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