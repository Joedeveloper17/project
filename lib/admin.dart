import 'package:flutter/material.dart';
import 'package:project/User.dart';
import 'package:project/login.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  final bool _value = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            width: 400,
            height: 400,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30),
                      ), //BoxDecoration

                      /** CheckboxListTile Widget **/
                      child: CheckboxListTile(
                        title: const Text('user'),
                        autofocus: false,
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        selected: _value,
                        dense: true,
                        value: _value,
                        onChanged: (bool? value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const Login()),
                          );
                        },
                      ), //CheckboxListTile
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ), //BoxDecoration

                      /** CheckboxListTile Widget **/
                      child: CheckboxListTile(
                        title: const Text('Create '),
                        autofocus: false,
                        activeColor: Colors.red,
                        checkColor: Colors.black,
                        selected: _value,
                        dense: true,
                        value: _value,
                        onChanged: (bool? value) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const User()),
                          );
                        },
                      ),
                    ), //CheckboxListTile

                    const SizedBox(
                      height: 13,
                      width: 33,
                    ),
                    TextButton(
                      style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 20),
                        backgroundColor: Colors.black,
                        padding: const EdgeInsets.all(16.0),
                      ),
                      onPressed: () {},
                      child: const Text(
                        'Submit',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ), //Container
              ), //Padding
            ), //Center
          ),
        ), //SizedBox
      ),
      debugShowCheckedModeBanner: false, //Scaffold
    ); //MaterialApp
  }
}
