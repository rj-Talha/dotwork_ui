// ignore_for_file: prefer_const_constructors
import 'package:dotwork_ui/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginDialog extends StatefulWidget {
  const LoginDialog({super.key, required this.title});
  final String title;
  @override
  State<LoginDialog> createState() => LoginDialogState();
}

class LoginDialogState extends State<LoginDialog> {
  bool isHidden1 = true;
  bool isHidden = true;
  String? confirmPasswordError;
  String? emailError;
  String? passwordError;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.title),
      actions: [
        StatefulBuilder(builder: (context, setState) {
          return Column(
            children: [
              SizedBox(height: 10),
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
                  hintText: 'Email',
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
            ],
          );
        }),
        const SizedBox(height: 10),
        TextField(
          onChanged: (value) {
            if (value.isNotEmpty) {
              setState(() {
                emailError = null;
              });
            }
          },
          controller: passwordController,
          obscureText: isHidden,
          autocorrect: false,
          enableSuggestions: false,
          decoration: InputDecoration(
            errorText: passwordError,
            hintText: 'Password',
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    isHidden = !isHidden;
                  },
                );
              },
              icon: const Icon(
                Icons.visibility_off,
              ),
            ),
            prefixIcon: const Icon(Icons.lock),
            border: const OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            filled: true,
            fillColor: const Color.fromARGB(255, 224, 222, 222),
          ),
        ),
        const SizedBox(height: 10),
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextButton(
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
                  final email = emailController.text;
                  final password = passwordController.text;

                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: email,
                      password: password,
                    );
                    if (context.mounted) {
                      emailController.clear();
                      passwordController.clear();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const HomePage();
                          },
                        ),
                      );
                    }
                  } on FirebaseAuthException catch (_) {
                    setState(() {
                      emailError = 'Incorrect email or password';
                    });
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Something went wrong!'),
                      ),
                    );
                  }
                }
              },
              child: const Text(
                'Continue',
                style: TextStyle(
                  color: Colors.green,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'Close',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        )
      ],
    );
  }
}
