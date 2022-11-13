import 'package:flutter/material.dart';
import 'package:project/Project.dart';
import 'package:project/User.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final bool _value = false;
  final bool _val = false;
  final bool mon = false;

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: SingleChildScrollView(
            child: Center(
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
                            title: const Text(
                              'Create user',
                            ),
                            secondary: const Icon(Icons.verified_user),
                            autofocus: false,
                            activeColor: Colors.red,
                            checkColor: Colors.black,
                            selected: _value,
                            dense: true,
                            value: _value,
                            onChanged: (bool? value) {
                              setState(() {
                                value = _value;
                              });
                              print(User());

                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const User()),
                              );
                            },
                          ),
                          //CheckboxListTile
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.white,
                                offset: Offset(0.0, 0.0),
                                blurRadius: 0.0,
                                spreadRadius: 0.0,
                              ), //BoxShadow
                            ],
                          ),
                          child: CheckboxListTile(
                            title: const Text('Create Project'),
                            secondary:
                                const Icon(Icons.personal_injury_rounded),
                            autofocus: false,
                            activeColor: Colors.green,
                            checkColor: Colors.black,
                            selected: _val,
                            dense: false,
                            value: _val,
                            onChanged: (bool? value) {
                              setState(() {
                                value = _value;
                              });
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Project()),
                              );
                            },
                          ), //CheckboxListTile
                        ),
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
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()),
                            );
                          },
                          child: const Text(
                            'Submit',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: const TextStyle(fontSize: 20),
                            backgroundColor: Colors.blue,
                            padding: const EdgeInsets.all(22.0),
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            'Back',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ), //Container
                  ), //Padding
                ), //C
              ),
            ),
          )),
    );
  }
}
