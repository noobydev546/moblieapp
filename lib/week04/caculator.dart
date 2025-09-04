import 'package:flutter/material.dart';
import 'dart:math';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CaculatorState();
}

class _CaculatorState extends State<Calculator> {
  int number1 = 0;
  int number2 = 0;
  String result = '';

  TextEditingController tcNumber1 = TextEditingController();
  TextEditingController tcNumber2 = TextEditingController();

  void sum() {
    setState(() {
      number1 = int.tryParse(tcNumber1.text) ?? 0;
      number2 = int.tryParse(tcNumber2.text) ?? 0;

      result = "Result = ${number1 + number2}";
    });
  }

  void power() {
    setState(() {
      number1 = int.tryParse(tcNumber1.text) ?? 0;
      number2 = int.tryParse(tcNumber2.text) ?? 0;

      var value = pow(number1, number2);
      result = "Result = $value";
    });
  }

  void clear() {
    setState(() {
      tcNumber1.clear();
      tcNumber2.clear();
      result = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calculator',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: tcNumber1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Number 1'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: tcNumber2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: 'Number 2'),
            ),
          ),
          ElevatedButton(
            onPressed: sum,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
            child: Text('Sum', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: power,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Power', style: TextStyle(color: Colors.white)),
          ),
          ElevatedButton(
            onPressed: clear,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
            child: Text('Clear', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          Text(result, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
