import 'dart:math';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../navigation_provider.dart';
import '../main_1.dart' as p2_1;
import '../main_2.dart' as p2_2;
import '../main_3.dart' as p2_3;
import '../main_4.dart' as p2_4;
import '../main_5.dart' as p2_5;
import '../main_6.dart' as p2_6;

class StatefulPage extends StatelessWidget {
  const StatefulPage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<NavigationProvider>();
    final exercise = provider.selectedExercise;

    final exerciseNames = [
      "P2 — Main 1 (Good App)",
      "P2 — Main 2 (Say Hello)",
      "P2 — Main 3 (Secret Number)",
      "P2 — Main 4 (Dice Roller)", 
      "P2 — Main 5 (Counter)",
      "P2 — Main 6 (Shopping List)",
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
        return p2_1.GoodApp();
      case 1:
        return const p2_2.Ex22SayHello();
      case 2:
        return _buildP2Exercise3();
      case 3:
        return _buildP2Exercise4();
      case 4:
        return _buildP2Exercise5();
      case 5:
        return _buildP2Exercise6();
      default:
        return const Center(child: Text('Ejercicio no encontrado'));
    }
  }

  Widget _buildP2Exercise3() {
    return const p2_3.SecretNumberApp();
  }

  Widget _buildP2Exercise4() {
    return const p2_4.Ex24DiceRoller();
  }

  Widget _buildP2Exercise5() {
    return p2_5.CounterApp();
  }

  Widget _buildP2Exercise6() {
    return const p2_6.Ex26ShoppingListIconsDialog();
  }
}

// Widget simplificado para dados sin dependencias externas
class _SimpleDiceRoller extends StatefulWidget {
  @override
  _SimpleDiceRollerState createState() => _SimpleDiceRollerState();
}

class _SimpleDiceRollerState extends State<_SimpleDiceRoller> {
  int _left = 1;
  int _right = 1;
  final _random = Random();

  void _roll() {
    setState(() {
      _left = _random.nextInt(6) + 1;
      _right = _random.nextInt(6) + 1;
    });

    if (_left == 6 && _right == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('JACKPOT! 🎰'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Widget _buildDice(int value) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: Offset(2, 2),
          ),
        ],
      ),
      child: Center(
        child: Text(
          value.toString(),
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ex 2.4 – Dice Roller'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.shade100, Colors.green.shade100],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'ROLL THE DICE',
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildDice(_left),
                  const SizedBox(width: 24),
                  _buildDice(_right),
                ],
              ),
              const SizedBox(height: 36),
              ElevatedButton(
                onPressed: _roll,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    vertical: 12.0,
                    horizontal: 24.0,
                  ),
                ),
                child: const Text(
                  'ROLL THE DICE',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                'Total: ${_left + _right}',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _roll,
        child: const Icon(Icons.casino),
      ),
    );
  }
}