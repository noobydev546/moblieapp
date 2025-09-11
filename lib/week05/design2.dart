import 'package:flutter/material.dart';

class Design2 extends StatelessWidget {
  const Design2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[850],
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                backgroundImage: NetworkImage(
                  'https://icons.iconarchive.com/icons/diversity-avatars/avatars/512/batman-icon.png',
                ),
                minRadius: 35,
                maxRadius: 35,
              ),
            ),
            Divider(color: Colors.grey, height: 60),
            Text('Name', style: TextStyle(color: Colors.grey[400])),
            Text(
              'John Doe',
              style: TextStyle(color: Colors.yellow, fontSize: 22),
            ),
            SizedBox(height: 10),
            Text('Age', style: TextStyle(color: Colors.grey[400])),
            Text('22', style: TextStyle(color: Colors.yellow, fontSize: 22)),
            SizedBox(height: 10),
            Row(
              children: [
                Icon(Icons.mail, color: Colors.grey),
                SizedBox(width: 8),
                Text(
                  'john-doe@mymail.com',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
