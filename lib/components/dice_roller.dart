import 'package:flutter/material.dart';
import 'dart:math';

import 'package:tasks_organizer/components/animated_die.dart';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});
  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var dice1 = 1;
  var dice2 = 2;

  void rollDice() {
    setState(() {
      dice1 = randomizer.nextInt(6) + 1;
      dice2 = randomizer.nextInt(6) + 1;
    });
  }

  @override
  Widget build(context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedDie(value: dice1),
            AnimatedDie(value: dice2),
          ],
        ),
        TextButton(
          onPressed: rollDice,
          style: TextButton.styleFrom(
            padding: const EdgeInsets.all(20),
            foregroundColor: const Color.fromARGB(255, 255, 255, 255),
            textStyle: TextStyle(fontSize: 28, fontWeight: FontWeight(700)),
          ),
          child: const Text('Roll Dice'),
        ),
      ],
    );
  }
}
