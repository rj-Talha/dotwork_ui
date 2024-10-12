// ignore_for_file: camel_case_types, prefer_const_constructors, non_constant_identifier_names
import 'package:dotwork_ui/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

void SaveDataToFirestore(String data) {}

class dontHaveAcc extends StatefulWidget {
  const dontHaveAcc({super.key});

  @override
  State<dontHaveAcc> createState() => _dontHaveAccState();
}

class _dontHaveAccState extends State<dontHaveAcc> {
  String? emailError;
  String? passwordError;
  String? confirmPasswordError;
  late final emailController = TextEditingController();
  late final passwordController = TextEditingController();
  late final confirmPasswordController = TextEditingController();

  bool isHidden = true;
  bool isHidden1 = true;
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
            const SizedBox(height: 15),
            const Text(
              'Enter email and password below to registor for dotwork.',
              style: TextStyle(
                fontWeight: FontWeight.normal,
              ),
            ),
            const SizedBox(height: 25),
            TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    emailError = null;
                  });
                }
              },
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              enableSuggestions: false,
              controller: emailController,
              decoration: InputDecoration(
                  errorText: emailError,
                  filled: true,
                  fillColor: Color.fromARGB(255, 224, 222, 222),
                  hintText: 'enter your email here',
                  prefixIcon: Icon(Icons.mail),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide.none,
                  )),
            ),
            const SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    passwordError = null;
                  });
                }
              },
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              enableSuggestions: false,
              controller: passwordController,
              decoration: InputDecoration(
                errorText: passwordError,
                filled: true,
                fillColor: const Color.fromARGB(255, 224, 222, 222),
                hintText: 'enter your password here',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden = !isHidden;
                    });
                  },
                  icon: const Icon(Icons.visibility_off),
                ),
                prefixIcon: const Icon(Icons.mail),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: isHidden,
            ),
            SizedBox(height: 15),
            TextField(
              onChanged: (value) {
                if (value.isNotEmpty) {
                  setState(() {
                    confirmPasswordError = null;
                  });
                }
              },
              keyboardType: TextInputType.emailAddress,
              autocorrect: false,
              enableSuggestions: false,
              controller: confirmPasswordController,
              decoration: InputDecoration(
                errorText: confirmPasswordError,
                filled: true,
                fillColor: const Color.fromARGB(255, 224, 222, 222),
                hintText: 'confirm password',
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isHidden1 = !isHidden1;
                    });
                  },
                  icon: const Icon(Icons.visibility_off),
                ),
                prefixIcon: const Icon(Icons.mail),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide.none,
                ),
              ),
              obscureText: isHidden1,
            ),
            const SizedBox(height: 30),
            TextButton(
              style: const ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                ),
                backgroundColor: WidgetStatePropertyAll(
                  Colors.blue,
                ),
                fixedSize: WidgetStatePropertyAll(
                  Size(200, 55),
                ),
              ),
              onPressed: () async {
                if (emailController.text.isEmpty) {
                  setState(() {
                    emailError = 'Incorrect email';
                  });
                } else if (passwordController.text.isEmpty) {
                  setState(
                    () {
                      passwordError = 'Incorrect Password';
                    },
                  );
                } else if (confirmPasswordController.text.isEmpty) {
                  setState(
                    () {
                      confirmPasswordError = 'Incorrect Password';
                    },
                  );
                } else if (passwordController.text !=
                    confirmPasswordController.text) {
                  setState(
                    () {
                      passwordError = 'Password does not match';
                      confirmPasswordError = 'Password does not match';
                    },
                  );
                } else {
                  emailController.clear();
                  passwordController.clear();
                  final email = emailController.text;
                  final password = passwordController.text;

                  try {
                    FirebaseFirestore.instance.collection("User's").add({
                      'registeredEmails': email,
                    });
                  } catch (_) {
                    setState(() {
                      emailError = 'Something went wrong';
                    });
                  }
                  FirebaseAuth.instance.createUserWithEmailAndPassword(
                    email: email,
                    password: password,
                  );

                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const HomePage();
                      },
                    ),
                  );
                }
              },
              child: const Text(
                'Registor Now',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
