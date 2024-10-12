// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class loginPage extends StatefulWidget {
  const loginPage({super.key});

  @override
  State<loginPage> createState() => _loginPageState();
}

class _loginPageState extends State<loginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          children: [
            Image.asset('images/image.png'),
            const SizedBox(width: 10),
            const Text(
              'dotwork',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        titleTextStyle: const TextStyle(
          color: Color.fromARGB(255, 0, 68, 193),
          fontSize: 30,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 15),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Welcome to dotwork',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Image.asset(
              'images/dotwork.png',
              height: 700,
              width: 600,
            ),
          ],
        ),
      ),
    );
  }
}
