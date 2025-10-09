import 'package:flutter/material.dart';

class BackgroundDemo extends StatefulWidget {
  const BackgroundDemo({super.key});

  @override
  State<BackgroundDemo> createState() => _BackgroundDemoState();
}

class _BackgroundDemoState extends State<BackgroundDemo> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Farm', style: TextStyle(color: Colors.red)),
        backgroundColor: Colors.cyan[100],
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: Column(
          children: [Image.asset('assets/images/sky.jpg', fit: BoxFit.cover)],
        ),
      ),
    );
  }
}
