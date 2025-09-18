import 'package:flutter/material.dart';

const Color bgColor = Color(0xFF202020);
const Color primaryColor = Color(0xFFFFBD73);

class LoginDesign extends StatelessWidget {
  const LoginDesign({super.key});

  Widget createIconButton() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          Row(
            children: [
              Ink(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 80, 80, 80),
                      width: 2,
                    ),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.android,
                    color: const Color.fromARGB(255, 80, 80, 80),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Ink(
                decoration: ShapeDecoration(
                  shape: CircleBorder(
                    side: BorderSide(
                      color: const Color.fromARGB(255, 80, 80, 80),
                      width: 2,
                    ),
                  ),
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.message,
                    color: const Color.fromARGB(255, 80, 80, 80),
                  ),
                ),
              ),
            ],
          ),

          Spacer(),

          Ink(
            decoration: ShapeDecoration(
              shape: CircleBorder(),
              color: primaryColor,
            ),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.arrow_forward, color: bgColor),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 4,
            child: Image.asset('assets/images/baking.jpg', fit: BoxFit.cover),
          ),

          Expanded(
            flex: 6,
            child: Column(
              children: [
                SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              'sign in'.toUpperCase(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'Sign up'.toUpperCase(),
                                style: TextStyle(color: primaryColor),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 40),
                        Row(
                          children: [
                            Icon(Icons.alternate_email, color: primaryColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Email Address',
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Icon(Icons.lock_open_rounded, color: primaryColor),
                            SizedBox(width: 10),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 80),
                        createIconButton(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
