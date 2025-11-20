import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation_provider.dart';
import '../../../p3/exercici1/main_1.dart' as p3_1;
import '../../../p3/exercici1/main_2.dart' as p3_2;
import '../../../p3/exercici1/main_3.dart' as p3_3;
import '../../../p3/exercici1/main_4.dart' as p3_4;
import '../../../p3/exercici1/main_5.dart' as p3_5;
import '../../../p3/exercici1/main_6.dart' as p3_6;

class StatelessPage extends StatelessWidget {
  const StatelessPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final exercise = provider.selectedExercise;

    final exerciseNames = [
      "P3 — Exercici 1 (Hola Mundo)",
      "P3 — Exercici 2", 
      "P3 — Exercici 3",
      "P3 — Exercici 4",
      "P3 — Exercici 5",
      "P3 — Exercici 6",
    ];

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: DropdownButton<int>(
            isExpanded: true,
            value: exercise,
            items: List.generate(
              exerciseNames.length,
              (i) => DropdownMenuItem(
                value: i,
                child: Text(exerciseNames[i]),
              ),
            ),
            onChanged: provider.setExercise,
          ),
        ),
        Expanded(
          child: _buildExerciseWidget(exercise),
        ),
      ],
    );
  }

  Widget _buildExerciseWidget(int exercise) {
    switch (exercise) {
      case 0:
        return const Scaffold(
          body: Center(
            child: Text('Hola mundo, soy Dani Nieto!'),
          ),
        );
      case 1:
        return const p3_2.Bienvenida();
      case 2:
        return _buildP3Exercise3();
      case 3:
        return _buildP3Exercise4();
      case 4:
        return _buildP3Exercise5();
      case 5:
        return _buildP3Exercise6();
      default:
        return const Center(child: Text('Ejercicio no encontrado'));
    }
  }

  Widget _buildP3Exercise3() {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/bymax.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.person,
                  size: 100,
                  color: Colors.blue,
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Hola! soy Dani Nieto",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildP3Exercise4() {
    return Scaffold(
      backgroundColor: const Color(0xFFF9F9F9),
      body: const Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 40),
            CircleAvatar(
              radius: 60,
              child: Icon(Icons.person, size: 60),
            ),
            SizedBox(height: 16),
            Text(
              'Marta Casserres',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Card(
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.email),
                      title: Text('marta@example.com'),
                    ),
                    ListTile(
                      leading: Icon(Icons.phone),
                      title: Text('934748474'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildP3Exercise5() {
    final names = [
      "Ellison Curry", "Briggs Willis", "Alexa Murphy", "Cameron Berry",
      "Annabelle Villarreal", "Nikolai Wiley", "Lauryn Morrow", "Kyree Hardy",
    ];
    const body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 5 lista infinita de Dani Nieto"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(name[0]),
            ),
            title: Text(name),
            subtitle: const Text(body),
          );
        },
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }

  Widget _buildP3Exercise6() {
    final names = [
      "Ellison Curry", "Briggs Willis", "Alexa Murphy", "Cameron Berry",
      "Annabelle Villarreal", "Nikolai Wiley", "Lauryn Morrow", "Kyree Hardy",
      "Wells Wilson", "Luna Foster", "Kayden Taylor", "Sofia Mann",
    ];
    const body = "Lorem ipsum dolor sit amet, consectetur adipiscing elit.";
    
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ejercicio 6 - Lista con navegación"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          final name = names[index];
          return ListTile(
            leading: CircleAvatar(
              child: Text(name[0]),
            ),
            title: Text(name),
            subtitle: const Text(body),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              // Simulación de navegación
            },
          );
        },
      ),
    );
  }
}