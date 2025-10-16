import 'package:flutter/material.dart';

class CdSwDemo extends StatefulWidget {
  const CdSwDemo({super.key});

  @override
  State<CdSwDemo> createState() => _CdSwDemoState();
}

class _CdSwDemoState extends State<CdSwDemo> {
  // state variable for a checkbox
  bool cb = false;
  bool sw = false;

  // method to update a checkbox
  void updateCB(bool? value) {
    setState(() {
      cb = value!;
    });
  }

  // method to update a switch
  void updateSW(bool? value) {
    setState(() {
      sw = value!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Checkbox(value: cb, onChanged: updateCB),
                Text('Red'),
                SizedBox(width: 20),
                Text('Checkbox status: $cb'),
              ],
            ),

            Row(
              children: [
                Switch(value: sw, onChanged: updateSW),
                Text('Football'),
                SizedBox(width: 20),
                Text('Checkbox status: $sw'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
