// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, use_super_parameters

import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RecoverWithEmail extends StatefulWidget {
  const RecoverWithEmail({Key? key}) : super(key: key);

  @override
  State<RecoverWithEmail> createState() => _RecoverWithEmailState();
}

class _RecoverWithEmailState extends State<RecoverWithEmail> {
  List<String> users = [];
  String? emailError;
  bool emailFound = false;
  bool isHidden = false;

  final TextEditingController emailController = TextEditingController();

  Future<void> resetPassword(
    String email,
  ) async {
    try {
      QuerySnapshot users =
          await FirebaseFirestore.instance.collection("User's").get();
      for (final user in users.docs) {
        if (email == user.get("registeredEmails")) {
          await FirebaseAuth.instance.sendPasswordResetEmail(email: email);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => const PasswordResetConfirmation()),
          );
          emailFound = true;
        }
      }
      if (!emailFound) {
        setState(() {
          emailError = 'Email not registered';
        });
      }
    } catch (e) {
      setState(() {
        emailError = 'Something went wrong !';
      });
    }
  }

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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text(
              'Enter your recovery email',
              style: TextStyle(
                color: Colors.grey,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    emailError = null;
                  });
                }
              },
              onSubmitted: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    emailError = null;
                  });
                }
              },
              autocorrect: false,
              enableSuggestions: false,
              controller: emailController,
              decoration: InputDecoration(
                errorText: emailError,
                hintText: 'Enter your email',
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.all(
                    Radius.circular(10),
                  ),
                ),
                filled: true,
                fillColor: Color.fromARGB(255, 224, 222, 222),
              ),
            ),
            const SizedBox(height: 10),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: () async {
                if (emailController.text.isEmpty) {
                  setState(() {
                    emailError = 'Please enter an email';
                  });
                } else {
                  emailController.clear();
                  resetPassword(
                    emailController.text.trim(),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(200, 50),
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                'Reset Password',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordResetConfirmation extends StatelessWidget {
  const PasswordResetConfirmation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 100,
          ),
          SizedBox(height: 20),
          Text(
            'Password reset email sent successfully!',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
