import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  String message = '';
  TextEditingController tcName = TextEditingController();

  void updatemessage() {
    setState(() {
      message = tcName.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Input Demo')),
      body: Column(
        children: [
          TextField(controller: tcName),
          ElevatedButton(onPressed: updatemessage, child: Text('OK')),
          Text(message),
        ],
      ),
    );
  }
}
