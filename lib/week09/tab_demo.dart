import 'package:flutter/material.dart';

class TabDemo extends StatefulWidget {
  const TabDemo({super.key});

  @override
  State<TabDemo> createState() => _TabDemoState();
}

class _TabDemoState extends State<TabDemo> {
  String msg1 = 'Home';

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Tab Demo'),
          // bottom: TabBar(
          //   tabs: [
          //     Tab(icon: Icon(Icons.home), text: 'Home'),
          //     Tab(icon: Icon(Icons.train), text: 'Train'),
          //     Tab(icon: Icon(Icons.bike_scooter), text: 'Bike'),
          //   ],
          // ),
        ),
        bottomNavigationBar: Container(
          color: Colors.grey[200],
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.home), text: 'Home'),
              Tab(icon: Icon(Icons.train), text: 'Train'),
              Tab(icon: Icon(Icons.bike_scooter), text: 'Bike'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(color: Colors.yellow, child: Text(msg1)),
            Container(color: Colors.green, child: Icon(Icons.access_alarm)),
            Container(
              color: Colors.orange,
              child: Row(
                children: [
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        msg1 = 'Change!';
                      });
                    },
                    child: Text('OK'),
                  ),
                  FilledButton(
                    onPressed: () {
                      setState(() {
                        msg1 = 'Home';
                      });
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
