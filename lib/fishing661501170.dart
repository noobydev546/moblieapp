// ID: 6631501170
import 'dart:math';
import 'package:flutter/material.dart';

class Fishing extends StatefulWidget {
  const Fishing({super.key});

  @override
  State<Fishing> createState() => _FishingState();
}

class _FishingState extends State<Fishing> {
  // Fish data
  List fish = [
    {
      'name': 'AnglerFish',
      'price': 20,
      'image': 'assets/images/fish/anglerfish.png',
    },
    {
      'name': 'NeonTerTra',
      'price': 10,
      'image': 'assets/images/fish/neon-tetra.png',
    },
    {
      'name': 'Puffer',
      'price': 5,
      'image': 'assets/images/fish/puffer-fish.png',
    },
    {'name': 'Shark', 'price': 10, 'image': 'assets/images/fish/shark.png'},
  ];
  int worms = 5;
  int coins = 0;
  int sum = 0;
  int fishAmount = 0;
  String results = '';
  String pathIMG = 'assets/images/fish/fisherman.png';

  final Random random = Random();

  Widget buildWorms(int worms) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(worms, (index) {
        return Icon(Icons.waves_rounded, color: Colors.red, size: 30);
      }),
    );
  }

  Widget createFilledButton() {
    return Column(
      children: [
        SizedBox(height: 60),
        Text(results, style: TextStyle(fontSize: 18)),
        SizedBox(height: 5),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.green),
          onPressed: worms == 0 ? () {} : fishing,
          child: const Text('Fishing'),
        ),
        SizedBox(height: 5),
        FilledButton(
          style: FilledButton.styleFrom(backgroundColor: Colors.red),
          onPressed: reset,
          child: const Text('Reset'),
        ),
      ],
    );
  }

  void fishing() {
    int getFish = random.nextInt(fish.length);
    int amount = random.nextInt(10);
    setState(() {
      worms--;
      pathIMG = fish[getFish]['image'];
      sum = fish[getFish]['price'];
      fishAmount = sum * amount;
      coins += fishAmount;
      results = '${fish[getFish]['name']} X  $amount = $fishAmount';
    });
  }

  void reset() {
    setState(() {
      pathIMG = 'assets/images/fish/fisherman.png';
      coins = 0;
      worms = 5;
      results = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Fishing Game',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Worms: '), buildWorms(worms)],
              ),
              SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.currency_exchange, color: Colors.amber),
                  SizedBox(width: 4),
                  Text('$coins', style: TextStyle(fontSize: 18)),
                ],
              ),
              Spacer(),
              Image.asset(pathIMG, height: 150, width: 150),

              createFilledButton(),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}
