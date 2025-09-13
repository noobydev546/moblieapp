import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  TextEditingController tcNumber1 = TextEditingController();
  TextEditingController tcNumber2 = TextEditingController();
  String result = '';

  void calculate() {
    int? num1 = int.tryParse(tcNumber1.text);
    int? num2 = int.tryParse(tcNumber2.text);
    int sum = 0;

    if (num1 == null || num2 == null) {
      setState(() {
        result = 'Incorrect input';
      });
      return;
    }
    sum = num1 + num2;

    setState(() {
      result = 'Result = $sum';
    });
  }

  void clear() {
    tcNumber1.clear();
    tcNumber2.clear();
    setState(() {
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: tcNumber1,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'First number',
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    '+',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextField(
                        controller: tcNumber2,
                        keyboardType: TextInputType.number,
                        decoration: const InputDecoration(
                          hintText: 'Second number',
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Colors.blue),
                    onPressed: calculate,
                    child: const Text('Calculate'),
                  ),
                  const SizedBox(width: 8),
                  FilledButton(
                    style: FilledButton.styleFrom(backgroundColor: Colors.red),
                    onPressed: clear,
                    child: const Text('Clear'),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                result,
                style: const TextStyle(fontSize: 16, color: Colors.red),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
