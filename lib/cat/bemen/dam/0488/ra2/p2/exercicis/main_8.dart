import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
import 'pages/stateless_page.dart';
import 'pages/stateful_page.dart';

void main() {
  runApp(const Exercici8App()); // App de navegación con tabs
}

class Exercici8App extends StatelessWidget {
  const Exercici8App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(), // Provider para controlar la navegación
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const Exercici8Home(), // Pantalla principal con tabs
      ),
    );
  }
}

class Exercici8Home extends StatelessWidget {
  const Exercici8Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>(); // Escucha cambios del provider
    final selected = provider.selectedBottom; // Índice del tab seleccionado

    final pages = [ // Array con las páginas de cada tab
      const StatelessPage(), // Tab 0: Ejercicios P3
      const StatefulPage(),  // Tab 1: Ejercicios P2
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text("Exercici 2.8 — Navegació"),
      ),
      body: pages[selected], // Muestra la página según el tab seleccionado
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected, // Tab actual marcado
        onTap: provider.setBottom, // Cambia de tab al hacer tap
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