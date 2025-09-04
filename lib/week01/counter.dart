import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //state variable
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter app')),
      body: Text('Count = $count'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // debugPrint(message);
          setState(() {
            count++;
          });
        },
        child: Text('Click'),
      ),
    );
    ;
  }
}
