// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:project/User.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(15),
                child: const TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Project Name',
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(15),
                child: const TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Company detail',
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Website',
                  ),
                ),
              ),
              const Padding(
                padding: const EdgeInsets.all(15),
                child: const TextField(
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Location',
                  ),
                ),
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const User()),
                  );
                },
                child: const Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ])));
  }
}
