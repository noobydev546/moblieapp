import 'package:flutter/material.dart';

class InputDemo extends StatefulWidget {
  const InputDemo({super.key});

  @override
  State<InputDemo> createState() => _InputDemoState();
}

class _InputDemoState extends State<InputDemo> {
  final List<Map<String, String>> users = [
    {"username": "admin", "password": "1111"},
    {"username": "test", "password": "2222"},
  ];

  String username = '';
  String password = '';
  String err_msg = '';

  TextEditingController tcName = TextEditingController();
  TextEditingController tcPassword = TextEditingController();

  void updatemessage() {
    setState(() {
      username = tcName.text;
      password = tcPassword.text;

      err_msg = "Wrong username or password";

      for (var user in users) {
        if (user['username'] == username && user['password'] == password) {
          err_msg = "Welcome $username";
          break;
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: tcName,
              decoration: InputDecoration(hintText: 'Username'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: tcPassword,
              obscureText: true,
              decoration: InputDecoration(hintText: 'Password'),
            ),
          ),
          ElevatedButton(
            onPressed: updatemessage,
            style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
            child: Text('Login', style: TextStyle(color: Colors.white)),
          ),
          SizedBox(height: 16),
          Text(err_msg, style: TextStyle(color: Colors.red)),
        ],
      ),
    );
  }
}
