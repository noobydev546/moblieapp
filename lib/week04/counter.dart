import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //state variable
  int count = 0;

  //methods
  void update() {
    setState(() {
      count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Counter app',
          style: TextStyle(fontSize: 32, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
      ),
      body: Center(
        child: Text(
          'Count = $count',
          style: TextStyle(fontSize: 26, color: Color.fromARGB(255, 0, 0, 0)),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: update,
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        child: Text('Click', style: TextStyle(color: Colors.white)),
      ),
    );
  }
}
