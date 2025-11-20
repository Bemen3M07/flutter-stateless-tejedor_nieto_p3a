import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Ex24DiceRoller extends StatefulWidget {
  const Ex24DiceRoller({super.key});

  @override
  State<Ex24DiceRoller> createState() => _Ex24DiceRollerState();
}

class _Ex24DiceRollerState extends State<Ex24DiceRoller> {
  final Random _rng = Random();
  int _left = 1;
  int _right = 1;

  void _roll() {
    setState(() {
      _left = _rng.nextInt(6) + 1; // 1..6
      _right = _rng.nextInt(6) + 1; // 1..6
    });

    if (_left == 6 && _right == 6) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('JACKPOT!'), duration: Duration(seconds: 2)),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final leftAsset = 'assets/dice/dice_$_left.svg';
    final rightAsset = 'assets/dice/dice_$_right.svg';

    return Scaffold(
      appBar: AppBar(title: const Text('Ex 2.4 – Dice Roller')),
      body: Stack(
        children: [
          // Fondo opcional (si tienes tapestry.png en assets/images/)
          Positioned.fill(
            child: Image.asset(
              'assets/images/tapestry.png',
              fit: BoxFit.cover,
              errorBuilder: (_, __, ___) => const SizedBox.shrink(),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ROLL THE DICE', style: Theme.of(context).textTheme.headlineSmall),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      leftAsset,
                      width: 140,
                      height: 140,
                      placeholderBuilder: (_) => const SizedBox(
                        width: 140,
                        height: 140,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                    const SizedBox(width: 24),
                    SvgPicture.asset(
                      rightAsset,
                      width: 140,
                      height: 140,
                      placeholderBuilder: (_) => const SizedBox(
                        width: 140,
                        height: 140,
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 36),
                ElevatedButton(
                  onPressed: _roll,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 18.0),
                    child: Text('ROLL THE DICE'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _roll,
        child: Image.asset(
          'assets/dicerollericon.jpg',
          width: 28,
          height: 28,
          errorBuilder: (_, __, ___) => const Icon(Icons.casino),
        ),
      ),
    );
  }
}