import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'navigation_provider.dart';
import 'stateless_page.dart' as sp;
import 'stateful_page.dart' as sf;

// Importamos todos los ejercicios P3 con prefijos para evitar conflictos
import '../../p3/exercici1/main_1.dart' as p3_1;
import '../../p3/exercici1/main_2.dart' as p3_2;
import '../../p3/exercici1/main_3.dart' as p3_3;
import '../../p3/exercici1/main_4.dart' as p3_4;
import '../../p3/exercici1/main_5.dart' as p3_5;
import '../../p3/exercici1/main_6.dart' as p3_6;

// Importamos todos los ejercicios P2 de la misma carpeta
import 'main_1.dart' as p2_1;
import 'main_2.dart' as p2_2;
import 'main_3.dart' as p2_3;
import 'main_4.dart' as p2_4;
import 'main_5.dart' as p2_5;
import 'main_6.dart' as p2_6;

void main() {
  runApp(const Exercici28App()); // App principal que conecta todos los ejercicios
}

class Exercici28App extends StatelessWidget {
  const Exercici28App({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => NavigationProvider(), // Provider para manejar la navegación entre tabs
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Ex 2.8 - Navegació', // Título de la aplicación
        home: const Exercici28Home(), // Pantalla principal con navegación
      ),
    );
  }
}

class Exercici28Home extends StatelessWidget {
  const Exercici28Home({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>(); // Escucha cambios del provider
    final selected = provider.selectedBottomIndex; // Índice del tab actual

    final p3Factories = <sp.WidgetFactory>[ // Lista de widgets P3 (stateless)
      () => p3_1.MainApp(),
      () => p3_2.MainApp(),
      () => p3_3.MainApp(),
      () => p3_4.MainApp(),
      () => p3_5.MainApp(),
      () => p3_6.MainApp(),
    ];

    final p3Labels = <String>[ // Nombres que aparecen en el dropdown de P3
      'MainApp (1)',
      'Bienvenida',
      'MainApp (3)',
      'ContactScreen',
      'MainApp (5)',
      'MainApp (6)',
    ];

    final p2Factories = <sf.WidgetFactory>[ // Lista de widgets P2 (stateful)
      () => p2_1.GoodApp(),
      () => p2_2.Ex22SayHello(),
      () => p2_3.SecretNumberApp(),
      () => p2_4.Ex24DiceRoller(),
      () => p2_5.CounterApp(),
      () => p2_6.Ex26ShoppingListIconsDialog(),
    ];

    final p2Labels = <String>[ // Nombres que aparecen en el dropdown de P2
      'GoodApp',
      'Ex22SayHello',
      'SecretNumberApp',
      'Ex24DiceRoller',
      'CounterApp',
      'Ex26ShoppingListIconsDialog',
    ];

    final pages = [ // Array con las dos páginas principales
      sp.StatelessPage(widgets: p3Factories, labels: p3Labels), // Tab 0: P3
      sf.StatefulPage(widgets: p2Factories, labels: p2Labels),  // Tab 1: P2
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Exercici 2.8 — Navegació')),
      body: pages[selected], // Muestra la página según el tab seleccionado
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selected, // Tab marcado actualmente
        onTap: (i) => provider.selectedBottomIndex = i, // Cambia de tab
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.layers), label: 'P3 (Stateless)'),
          BottomNavigationBarItem(icon: Icon(Icons.dashboard), label: 'P2 (Stateful)'),
        ],
      ),
    );
  }
}
