import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation_provider.dart';
import '../../../p3/exercici1/main_1.dart';
import '../../../p3/exercici1/main_2.dart';
import '../../../p3/exercici1/main_3.dart';
import '../../../p3/exercici1/main_4.dart';
import '../../../p3/exercici1/main_5.dart';
import '../../../p3/exercici1/main_6.dart';

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final exercise = provider.selectedExercise;

    final exercises = [
      const P3Main1(),
      const P3Main2(),
      const P3Main3(),
      const P3Main4(),
      const P3Main5(),
      const P3Main6(),
    ];

    return Column(
      children: [
        // Menú superior
        DropdownButton<int>(
          value: exercise,
          items: const [
            DropdownMenuItem(value: 0, child: Text("P3 — Exercici 1")),
            DropdownMenuItem(value: 1, child: Text("P3 — Exercici 2")),
            DropdownMenuItem(value: 2, child: Text("P3 — Exercici 3")),
            DropdownMenuItem(value: 3, child: Text("P3 — Exercici 4")),
            DropdownMenuItem(value: 4, child: Text("P3 — Exercici 5")),
            DropdownMenuItem(value: 5, child: Text("P3 — Exercici 6")),
          ],
          onChanged: provider.setExercise,
        ),

        Expanded(child: exercises[exercise]),
      ],
    );
  }
}