import 'dart:async';

import 'package:flutter/material.dart';

class TimerDemo extends StatefulWidget {
  const TimerDemo({super.key});

  @override
  State<TimerDemo> createState() => _TimerDemoState();
}

class _TimerDemoState extends State<TimerDemo> {
  String message = 'Start';

  @override
  void initState() {
    super.initState();
    // create a countdown timer
    // Timer(Duration(seconds: 3), () {
    //   setState(() {
    //     message = 'Stop';
    //   });
    // });
    Future.delayed(Duration(seconds: 3), () {
      setState(() {
        message = 'Stop';
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.topCenter,
          child: Text(message, style: TextStyle(fontSize: 30)),
        ),
      ),
    );
  }
}
