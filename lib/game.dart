import 'dart:math';

import 'package:flutter/material.dart';

class NumberGuess extends StatefulWidget {
  const NumberGuess({super.key});

  @override
  State<NumberGuess> createState() => _NumberGuessState();
}

class _NumberGuessState extends State<NumberGuess> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _controller = TextEditingController();
  String _feedbackMessage = '';
  int _randomNumber = Random().nextInt(100) + 1;
  int _guesses = 0;

  void _checkGuess() {
    setState(() {
      _guesses++;
      int guess = int.tryParse(_controller.text) ?? 0;

      if (guess < _randomNumber) {
        _feedbackMessage = 'Too Low! Try again.';
      } else if (guess > _randomNumber) {
        _feedbackMessage = 'Too High! Try again.';
      } else {
        _feedbackMessage =
            'Congratulations! You guessed it in $_guesses guesses!';
      }
    });
  }

  void _resetGame() {
    setState(() {
      _randomNumber = Random().nextInt(100) + 1;
      _feedbackMessage = '';
      _controller.clear();
      _guesses = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Number Guessing Game",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _controller,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter a number";
                  }
                  if (int.tryParse(value) == null) {
                    return "Please enter a valid number";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Enter a number to guess",
                  border: OutlineInputBorder(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _checkGuess();
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Click Me",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
              Text(
                _feedbackMessage,
                style: const TextStyle(fontSize: 20),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {
                    _resetGame();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                  ),
                  child: const Text(
                    "Restart",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
