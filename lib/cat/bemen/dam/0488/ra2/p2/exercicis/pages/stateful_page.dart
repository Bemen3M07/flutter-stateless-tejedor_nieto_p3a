import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation_provider.dart';
import '../../../p2/exercicis/main_1.dart' hide MyApp;
import '../../../p2/exercicis/main_2.dart';
import '../../../p2/exercicis/main_3.dart';
import '../../../p2/exercicis/main_4.dart';
import '../../../p2/exercicis/main_5.dart' hide MyApp;
import '../../../p2/exercicis/main_6.dart';

class StatefulPage extends StatelessWidget {
  const StatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final exercise = provider.selectedExercise;

    final exercises = [
      GoodApp(),
      const Ex22SayHello(),
      const SecretNumberApp(),
      const Ex24DiceRoller(),
      CounterApp(),
      const Ex26ShoppingListIconsDialog(),
    ];

    return Column(
      children: [
        DropdownButton<int>(
          value: exercise,
          items: const [
            DropdownMenuItem(value: 0, child: Text("P2 — Exercici 1")),
            DropdownMenuItem(value: 1, child: Text("P2 — Exercici 2")),
            DropdownMenuItem(value: 2, child: Text("P2 — Exercici 3")),
            DropdownMenuItem(value: 3, child: Text("P2 — Exercici 4")),
            DropdownMenuItem(value: 4, child: Text("P2 — Exercici 5")),
            DropdownMenuItem(value: 5, child: Text("P2 — Exercici 6")),
          ],
          onChanged: (int? value) {
            if (value != null) provider.setExercise(value);
          },
        ),

        Expanded(child: exercises[exercise]),
      ],
    );
  }
}