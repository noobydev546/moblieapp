import 'dart:math';
import 'package:flutter/material.dart';

class BattleGame extends StatefulWidget {
  const BattleGame({super.key});

  @override
  State<BattleGame> createState() => _BattleGameState();
}

class _BattleGameState extends State<BattleGame> {
  int topLives = 5;
  int bottomLives = 5;
  final Random random = Random();
  String gameMessage = "";

  // Weak points (random heart index 0-4)
  int topWeakPoint = 0;
  int bottomWeakPoint = 0;

  @override
  void initState() {
    super.initState();
    _resetWeakPoints();
  }

  void _resetWeakPoints() {
    topWeakPoint = random.nextInt(5);
    bottomWeakPoint = random.nextInt(5);
  }

  void attack(bool fromTop) {
    if (topLives == 0 || bottomLives == 0) return;

    int guess = random.nextInt(5); // attacker’s guess

    setState(() {
      if (fromTop) {
        // Top attacks bottom
        if (guess == bottomWeakPoint && bottomLives > 0) {
          bottomLives--;
          bottomWeakPoint = random.nextInt(5); // new weak point
        }
      } else {
        // Bottom attacks top
        if (guess == topWeakPoint && topLives > 0) {
          topLives--;
          topWeakPoint = random.nextInt(5); // new weak point
        }
      }
    });

    // Check game over
    if (topLives == 0 || bottomLives == 0) {
      setState(() {
        gameMessage = topLives > 0
            ? "🎉 Top Player Wins!"
            : "🎉 Bottom Player Wins!";
      });
    }
  }

  void restartGame() {
    setState(() {
      topLives = 5;
      bottomLives = 5;
      gameMessage = "";
      _resetWeakPoints();
    });
  }

  /// ✅ Only returns a row of hearts
  Widget buildHearts(int lives) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(5, (index) {
        return Icon(
          Icons.favorite,
          color: index < lives ? Colors.red : Colors.black,
          size: 30,
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // Top player
          Expanded(
            child: Container(
              color: Colors.blue.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.blue,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  buildHearts(topLives),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: topLives > 0 && bottomLives > 0
                        ? () => attack(true)
                        : null,
                    child: const Text("Attack"),
                  ),
                ],
              ),
            ),
          ),

          const Divider(height: 2, thickness: 2),

          // Bottom player
          Expanded(
            child: Container(
              color: Colors.green.shade50,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.green,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  buildHearts(bottomLives),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: topLives > 0 && bottomLives > 0
                        ? () => attack(false)
                        : null,
                    child: const Text("Attack"),
                  ),
                ],
              ),
            ),
          ),

          // Message + Restart button
          if (gameMessage.isNotEmpty) ...[
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Text(
                gameMessage,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: restartGame,
              child: const Text("Restart"),
            ),
            const SizedBox(height: 10),
          ],
        ],
      ),
    );
  }
}
