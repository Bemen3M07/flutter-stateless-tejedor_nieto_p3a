import 'package:flutter/material.dart';

// P3 (STATLESS) Imports
import '../p3/exercici1/main_1.dart' as p3_1;
import '../p3/exercici1/main_2.dart' as p3_2;
import '../p3/exercici1/main_3.dart' as p3_3;
import '../p3/exercici1/main_4.dart' as p3_4;
import '../p3/exercici1/main_5.dart' as p3_5;
import '../p3/exercici1/main_6.dart' as p3_6;

// P2 (STATEFUL)
import 'main_1.dart' as p2_1;
import 'main_2.dart' as p2_2;
import 'main_3.dart' as p2_3;
import 'main_4.dart' as p2_4;
import 'main_5.dart' as p2_5;
import 'main_6.dart' as p2_6;
import 'main_7.dart' as p2_7;

import 'navigation_provider.dart';
import 'stateless_page.dart';
import 'stateful_page.dart';

void main() {
  runApp(const RootApp());
}

class RootApp extends StatelessWidget {
  const RootApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Exercici 2.8",
      home: AppShell(),
    );
  }
}

class AppShell extends StatefulWidget {
  @override
  State<AppShell> createState() => _AppShellState();
}

class _AppShellState extends State<AppShell> {
  final NavigationProvider nav = NavigationProvider();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: nav,
      builder: (_, __) {
        return Scaffold(
          appBar: AppBar(
            title: Text(nav.selectedBottomIndex == 0
                ? "P3 — Stateless"
                : "P2 — Stateful"),
            centerTitle: true,
          ),
          body: nav.selectedBottomIndex == 0
              ? StatelessPage(
                  widgets: [
                    () => p3_1.MainApp(),
                    () => p3_2.MainApp(),
                    () => p3_3.MainApp(),
                    () => p3_4.MainApp(),
                    () => p3_5.MainApp(),
                    () => p3_6.MainApp(),
                  ],
                )
              : StatefulPage(
                  widgets: [
                    () => p2_1.GoodApp(),
                    () => p2_2.Bienvenida(),
                    () => p2_3.SecretNumberApp(),
                    () => p2_4.Ex24DiceRoller(),
                    () => p2_5.CounterApp(),
                    () => p2_6.MainApp(),
                    () => p2_7.MyApp(),
                  ],
                ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: nav.selectedBottomIndex,
            onTap: (i) {
              nav.selectedBottomIndex = i;
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.layers),
                label: "Stateless (P3)",
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.bolt),
                label: "Stateful (P2)",
              ),
            ],
          ),
        );
      },
    );
  }
}