import "package:flutter/material.dart";
import "package:numberguesser/game.dart";

void main() => runApp(const NumberGuesser());

class NumberGuesser extends StatelessWidget {
  const NumberGuesser({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NumberGuess(),
    );
  }
}
