import 'package:flutter/material.dart';

class ButtonDemo extends StatelessWidget {
  const ButtonDemo({super.key});

  Widget createIconButton() {
    return OverflowBar(
      alignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: Icon(Icons.volume_up, color: Colors.red),
          onPressed: () {
            debugPrint('Icon button');
          },
        ),
        Ink(
          decoration: ShapeDecoration(
            shape: CircleBorder(),
            color: Colors.blue,
          ),
          child: IconButton(
            onPressed: () {
              debugPrint('Android');
            },
            icon: Icon(Icons.android, color: Colors.white),
          ),
        ),
      ],
    );
  }

  Widget createOutlineButton() {
    return OverflowBar(
      children: [
        OutlinedButton(onPressed: () {}, child: Text('OutlinedButton')),
        SizedBox(width: 8),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.red,
            backgroundColor: Colors.amber,
          ),
          child: Text('OutlinedButton'),
        ),
      ],
    );
  }

  Widget createButtons() {
    return OverflowBar(
      children: [
        TextButton(onPressed: () {}, child: Text('Text button')),
        ElevatedButton(onPressed: () {}, child: Text('Elevated button')),
        FilledButton(onPressed: () {}, child: Text('FIlled button')),
        FilledButton(
          onPressed: () {},
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          child: Text('FIlled button'),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 16),
            createIconButton(),
            Divider(),
            createOutlineButton(),
            Divider(),
            createButtons(),
          ],
        ),
      ),
    );
  }
}
