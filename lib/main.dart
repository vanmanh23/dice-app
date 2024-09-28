import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: const Text(
            "Dicee",
          ),
          centerTitle: true,
        ),
        body: const DiceePage(),
      ),
    );
  }
}

class DiceePage extends StatefulWidget {
  const DiceePage({super.key});

  @override
  State<DiceePage> createState() => _DiceePageState();
}

class _DiceePageState extends State<DiceePage> {
  int leftDiceNumber = 1, rightDiceNumber = 1;
  void changeDice(bool side) {
    setState(() {
      if (side == true) {
        leftDiceNumber = Random().nextInt(6) + 1;
      } else {
        rightDiceNumber = Random().nextInt(6) + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: IconButton(
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            onPressed: () {
              changeDice(true);
            },
            icon: Image.asset(
              "images/dice$leftDiceNumber.png",
            ),
          ),
        ),
        Expanded(
          child: IconButton(
            onPressed: () {
              changeDice(false);
            },
            padding: const EdgeInsets.all(16),
            splashColor: Colors.transparent,
            splashRadius: 0.1,
            icon: Image.asset(
              'images/dice$rightDiceNumber.png',
            ),
          ),
        ),
      ],
    );
  }
}