import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const QuizApp());
}

class QuizApp extends StatelessWidget {
  const QuizApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Mini Quiz App",
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const QuizPage(),
    );
  }
}

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final Random _random = Random();
  int score = 0;

  // 🔹 List of questions (with image, text, answers, correct answer)
  final List<Map<String, dynamic>> questions = [
    {
      "question": "Which fruit is this?",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/1/15/Red_Apple.jpg",
      "answers": ["Apple", "Banana", "Mango"],
      "correct": "Apple",
    },
    {
      "question": "Which animal is this?",
      "image": "https://upload.wikimedia.org/wikipedia/commons/3/3a/Cat03.jpg",
      "answers": ["Dog", "Cat", "Rabbit"],
      "correct": "Cat",
    },
    {
      "question": "Which flag is this?",
      "image":
          "https://upload.wikimedia.org/wikipedia/commons/a/a9/Flag_of_Thailand.svg",
      "answers": ["Thailand", "Japan", "France"],
      "correct": "Thailand",
    },
  ];

  Map<String, int> stats = {"correct": 0, "wrong": 0};

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pickRandomQuestion();
  }

  void _pickRandomQuestion() {
    setState(() {
      currentIndex = _random.nextInt(questions.length);
    });
  }

  void _checkAnswer(String answer) {
    final correctAnswer = questions[currentIndex]["correct"];
    if (answer == correctAnswer) {
      score++;
      stats["correct"] = stats["correct"]! + 1;
    } else {
      stats["wrong"] = stats["wrong"]! + 1;
    }
    _pickRandomQuestion();
  }

  @override
  Widget build(BuildContext context) {
    final currentQ = questions[currentIndex];

    return Scaffold(
      appBar: AppBar(title: Text("Quiz Game | Score: $score")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              currentQ["question"],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),

            const SizedBox(height: 15),

            Image.network(currentQ["image"], height: 150),

            const SizedBox(height: 20),

            // 🔹 Loop through answer buttons
            ...currentQ["answers"].map<Widget>((ans) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: ElevatedButton(
                  onPressed: () => _checkAnswer(ans),
                  child: Text(ans),
                ),
              );
            }).toList(),

            const SizedBox(height: 30),

            Text("✅ Correct: ${stats['correct']}"),
            Text("❌ Wrong: ${stats['wrong']}"),
          ],
        ),
      ),
    );
  }
}


// ✅ List → questions is a list of maps.

// ✅ Map → stats keeps track of correct & wrong answers.

// ✅ Random → _pickRandomQuestion() picks a random index.

// ✅ Loops → .map() creates multiple answer buttons.

// ✅ Image → Each question has an image.

// ✅ Buttons → User selects an answer.