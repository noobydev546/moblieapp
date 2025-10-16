import 'package:flutter/material.dart';

class Assignment3 extends StatefulWidget {
  const Assignment3({super.key});

  @override
  State<Assignment3> createState() => _Assignment3State();
}

class _Assignment3State extends State<Assignment3> {
  bool sw = false;
  double slider = 100;
  int radio = 0;
  String result = '';

  List menu = [
    {'name': 'Latte', 'price': 35},
    {'name': 'Americano', 'price': 30},
    {'name': 'Cappuccino', 'price': 40},
  ];

  List imgsrc = [
    'https://www.cuisinart.com/dw/image/v2/ABAF_PRD/on/demandware.static/-/Sites-us-cuisinart-sfra-Library/default/dw42dcae51/images/recipe-Images/cafe-latte1-recipe_resized.jpg?sw=1200&sh=1200&sm=fit',
    'https://assets.beanbox.com/blog_images/AB7ud4YSE6nmOX0iGlgA.jpeg',
    'https://www.livingnorth.com/images/media/articles/food-and-drink/eat-and-drink/coffee.png?fm=webp&w=1000',
  ];

  List<Widget> createRadio() {
    return List.generate(
      menu.length,
      (index) => RadioListTile(
        title: Text(
          '${menu[index]['name']} ${menu[index]['price']}',
          style: TextStyle(fontSize: 16),
        ),
        value: index,
        groupValue: radio,
        onChanged: updateRadio1,
      ),
    );
  }

  void updateRadio1(int? value) {
    setState(() {
      radio = value!;
    });
  }

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
    String coffee = menu[radio]['name'];
    int price = menu[radio]['price'];
    String type = sw ? 'Cold' : 'Hot';
    String sugar = slider == 0
        ? 'no'
        : slider == 50
        ? 'less'
        : 'normal';

    if (sw) {
      price += 5;
    }

    await showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Your Order'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.network(
                imgsrc[radio],
                width: 120,
                height: 120,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 10),
              Text('$type $coffee with $sugar sugar.\nPrice = $price baht'),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  result = '';
                });
              },
              child: const Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                setState(() {
                  result = 'Thank you for your order!';
                });
              },
              child: const Text('Ok'),
            ),
          ],
        );
      },
    );
  }

  Widget createButtons() {
    return FilledButton(onPressed: order, child: Text('ORDER'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MFU Coffee Shop', style: TextStyle(color: Colors.white)),
        backgroundColor: Color.fromARGB(255, 89, 70, 172),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Column(
            children: [
              Center(child: Text('Your Order', style: TextStyle(fontSize: 22))),
              SizedBox(height: 12),

              Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Coffee',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    Column(children: createRadio()),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Row(
                children: [
                  Text('Type', style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('Hot'),
                  Switch(value: sw, onChanged: updateSW),
                  Text('Cold(+5)'),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Text('Sugar', style: TextStyle(fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text('None'),
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
                ],
              ),
              SizedBox(height: 20),
              createButtons(),
              SizedBox(height: 20),
              Text(result, style: TextStyle(fontSize: 22, color: Colors.red)),
            ],
          ),
        ),
      ),
    );
  }
}
