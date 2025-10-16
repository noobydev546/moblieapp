import 'package:flutter/material.dart';
import 'package:moblieapp/week09/page2.dart';
import 'fruit.dart';

class Page1 extends StatelessWidget {
  const Page1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Page 1')),
      body: Container(
        alignment: Alignment.topCenter,
        child: FilledButton(
          onPressed: () {
            // jump to page 2
            Navigator.pushReplacement(
              context,
              // MaterialPageRoute(
              //   builder: (context) => Page2(),
              //   settings: RouteSettings(
              //     arguments: <String, dynamic>{
              //       'name': 'apple',
              //       'price': 15,
              //       'date': ['10 oct', '19 oct'],
              //     },
              //   ),
              // ),
              MaterialPageRoute(
                builder: (context) =>
                    Page2(fruit: Fruit('apple', 15, ['10 oct', '19 oct'])),
              ),
            );
          },
          child: Text('Next'),
        ),
      ),
    );
  }
}
