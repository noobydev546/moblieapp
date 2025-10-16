import 'package:flutter/material.dart';

class Assignment2 extends StatefulWidget {
  const Assignment2({super.key});

  @override
  State<Assignment2> createState() => _Assignment2State();
}

class _Assignment2State extends State<Assignment2> {
  bool sw = false;
  double slider = 100;

  void updateSW(bool? value) {
    setState(() {
      sw = value!;
    });
  }

  void updateSlider(double? value) {
    setState(() {
      slider = value!;
    });
  }

  void order() async {
    String type = sw ? 'Cold' : 'Hot';
    String sugar = slider == 0
        ? 'no'
        : slider == 50
        ? 'less'
        : 'normal';

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Order'),
          content: Text('$type coffee with $sugar sugar'),
        );
      },
    );
  }

  Widget createButtons() {
    return OverflowBar(
      children: [FilledButton(onPressed: order, child: Text('ORDER'))],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color.fromARGB(255, 89, 70, 172),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text('Your Order', style: TextStyle(fontSize: 22)),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Type'),
                  Spacer(),
                  Text('Hot'),
                  Switch(value: sw, onChanged: updateSW),
                  Text('Cold'),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Text('Sugar level'),
                  Spacer(),
                  Slider(
                    min: 0,
                    max: 100,
                    value: slider,
                    divisions: 2,
                    label: slider == 0
                        ? 'none'
                        : slider == 50
                        ? 'less'
                        : 'normal',
                    onChanged: updateSlider,
                  ),
                  Spacer(),
                  Text('Normal'),
                  Spacer(),
                ],
              ),
            ),
            createButtons(),
          ],
        ),
      ),
    );
  }
}
