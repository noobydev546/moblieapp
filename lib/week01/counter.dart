import 'package:flutter/material.dart';

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  //state variable
  String message = 'Hello world';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter app')),
      body: Text(message),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // debugPrint(message);
          setState(() {
            if (message == 'Hello world') {
              message = 'Hi';
            } else {
              message = 'Hello world';
            }
          });
        },
        child: Text('Click'),
      ),
    );
    ;
  }
}
