import 'package:flutter/material.dart';
import 'package:moblieapp/week09/fruit.dart';
import 'package:moblieapp/week09/page1.dart';
import 'fruit.dart';

class Page2 extends StatelessWidget {
  Fruit fruit;

  // constructor
  Page2({super.key, required this.fruit});

  @override
  Widget build(BuildContext context) {
    // Map<String, dynamic> data =
    //     ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return Scaffold(
      appBar: AppBar(title: Text('Page 2')),
      body: Column(
        children: [
          // Text('Name: ${data['name']}'),
          // Text('Price: ${data['price']}'),
          // Text('Manufracturing date: ${data['date'][0]}'),
          // Text('Expire: ${data['date'][1]}'),
          Text('Name: ${fruit.name}'),
          Text('Price: ${fruit.price}'),
          Text('Manufracturing date: ${fruit.date[0]}'),
          Text('Expire: ${fruit.date[1]}'),
          FilledButton(
            onPressed: () {
              // clear session and remove local storage

              // return to the previous page
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Page1()),
                (route) => false,
              );
            },
            child: Text('Back'),
          ),
        ],
      ),
    );
  }
}
