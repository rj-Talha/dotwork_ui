// ignore_for_file: prefer_const_constructors

import 'package:dotwork_ui/dialog.dart';
import 'package:dotwork_ui/dontHaveAcc.dart';
import 'package:dotwork_ui/firebase_options.dart';
import 'package:dotwork_ui/loginpage.dart';
import 'package:dotwork_ui/recoverwithemial.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
    ),
  );
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isChecked = true;
  bool isHidden = true;
  bool isHidden1 = true;
  String? emailError;
  String? passwordError;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

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
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Log in to your Account',
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  const Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Welcome back!Select the method to log in:',
                      style: TextStyle(
                        fontSize: 15,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          style: const ButtonStyle(
                            elevation: WidgetStatePropertyAll(1),
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () async {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const LoginDialog(
                                    title: 'login using google account');
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/download.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Google',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        ElevatedButton(
                          style: const ButtonStyle(
                            backgroundColor:
                                WidgetStatePropertyAll(Colors.white),
                            shape: WidgetStatePropertyAll(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const LoginDialog(
                                    title: 'login using facebook account');
                              },
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/facebook.png',
                                  height: 30,
                                  width: 30,
                                ),
                                const SizedBox(width: 10),
                                const Text(
                                  'Facebook',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 25),
                  const Row(
                    children: [
                      Flexible(
                        child: Divider(
                          color: Colors.black,
                          height: 5,
                          indent: 30,
                          endIndent: 10,
                        ),
                      ),
                      Text('or continue with email'),
                      Flexible(
                        child: Divider(
                          color: Colors.black,
                          height: 5,
                          indent: 10,
                          endIndent: 30,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 25,
                  ),
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
                  const SizedBox(
                    height: 12,
                  ),
                  TextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          passwordError = null;
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
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      errorText: passwordError,
                      suffixIcon: IconButton(
                        onPressed: () {
                          setState(() {
                            isHidden = !isHidden;
                          });
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
                    obscureText: isHidden,
                  ),
                  Row(
                    children: [
                      Checkbox(
                        value: isChecked,
                        activeColor: Colors.blue,
                        onChanged: (value) {
                          setState(() {
                            isChecked = !isChecked;
                          });
                        },
                      ),
                      const Text('Remember me'),
                      const SizedBox(width: 100),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const RecoverWithEmail();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'forget password',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  TextButton(
                    style: const ButtonStyle(
                      fixedSize: WidgetStatePropertyAll(Size(350, 50)),
                      backgroundColor: WidgetStatePropertyAll(
                        Colors.blue,
                      ),
                      shape: WidgetStatePropertyAll(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
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
                      } else {
                        final email = emailController.text;
                        final password = passwordController.text;

                        try {
                          await FirebaseAuth.instance
                              .signInWithEmailAndPassword(
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
                                  return const loginPage();
                                },
                              ),
                            );
                          }
                        } on FirebaseAuthException catch (_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Something went wrong!'),
                            ),
                          );
                        }
                      }
                    },
                    child: const Text(
                      'Log in',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text('dont have an account'),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const dontHaveAcc();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'create new account',
                          style: TextStyle(
                            color: Colors.blue,
                          ),
                        ),
                      ),
                    ],
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
