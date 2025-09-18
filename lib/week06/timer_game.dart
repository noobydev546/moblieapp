import 'dart:async';
import 'package:flutter/material.dart';

class TimerGame extends StatefulWidget {
  const TimerGame({super.key});

  @override
  State<TimerGame> createState() => _TimerGameState();
}

class _TimerGameState extends State<TimerGame> {
  double timeLeft = 1.00;
  int clickCount = 0;
  Timer? _timer;
  bool isRunning = false;

  void startGame() {
    setState(() {
      timeLeft = 1.00;
      clickCount = 0;
      isRunning = true;
    });

    _timer?.cancel();
    _timer = Timer.periodic(Duration(milliseconds: 10), (timer) {
      setState(() {
        timeLeft -= 0.01;
        if (timeLeft <= 0) {
          timeLeft = 0;
          isRunning = false;
          _timer?.cancel();
        }
      });
    });
  }

  void addClick() {
    if (isRunning) {
      setState(() {
        clickCount++;
      });
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                timeLeft.toStringAsFixed(2),
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),

              Text('Click = $clickCount', style: const TextStyle(fontSize: 30)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: addClick,
                    label: const Text(
                      'Click',
                      style: TextStyle(color: Colors.white),
                    ),
                    icon: const Icon(Icons.touch_app, color: Colors.white),
                    style: FilledButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                  ),

                  OutlinedButton.icon(
                    onPressed: startGame,
                    icon: const Icon(Icons.refresh, color: Colors.black),
                    label: const Text(
                      'PLAY',
                      style: TextStyle(color: Colors.red),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.black, width: 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
