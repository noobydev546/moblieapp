import 'dart:math';
import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  TextEditingController tcGuess = TextEditingController();
  String result = '';
  int answer = Random().nextInt(10);
  int chancesLeft = 3;
  bool gameOver = false;

  void guess() {
    if (gameOver) {
      replay();
      return;
    }

    int? userGuess = int.tryParse(tcGuess.text);
    if (userGuess == null) {
      setState(() {
        result = 'Please enter a number';
      });
      return;
    }

    setState(() {
      chancesLeft--;

      if (userGuess == answer) {
        result = 'Correct, you win!';
        gameOver = true;
      } else if (chancesLeft == 0) {
        result = 'Sorry, you lose. The answer is $answer';
        gameOver = true;
      } else if (userGuess > answer) {
        result = '$userGuess is too large, $chancesLeft Chance(s) left!';
      } else {
        result = '$userGuess is too small, $chancesLeft Chance(s) left!';
      }

      tcGuess.clear();
    });
  }

  void replay() {
    setState(() {
      answer = Random().nextInt(10);
      chancesLeft = 3;
      result = '';
      gameOver = false;
      tcGuess.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Guess a number game', style: TextStyle(fontSize: 22)),
              const SizedBox(height: 20),
              TextField(
                controller: tcGuess,
                keyboardType: TextInputType.number,
                enabled: !gameOver,
                decoration: const InputDecoration(
                  hintText: 'Guess a number 0-9',
                  border: UnderlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Column(
                  children: [
                    Text(
                      result,
                      style: const TextStyle(fontSize: 14, color: Colors.red),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 10),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: Colors.black, width: 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 12,
                        ),
                      ),
                      onPressed: guess,
                      child: Text(
                        gameOver ? 'Replay' : 'Guess',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
