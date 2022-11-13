import 'dart:html';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:project/User.dart';
import 'package:project/admin.dart';
import 'package:project/files.dart';
import 'package:project/userapi.dart';
import 'package:table_calendar/table_calendar.dart';

// ignore: must_be_immutable
class Project extends StatefulWidget {
  const Project({Key? key}) : super(key: key);

  @override
  State<Project> createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  List<Files>? files;
  var isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    files = await Userapi().getfiles();
    if (files != null) {
      setState(() {
        isloaded = true;
      });
    }
  }

  TextEditingController name = TextEditingController();
  TextEditingController passwords = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  final List<String> items = [
    'English',
    'tamil',
    'maths',
    'science',
  ];
  String? selectedValue;
  final TextEditingController textEditingController = TextEditingController();
  @override
  void dispose() {
    textEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(children: <Widget>[
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Project Name',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Project Date',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Company Details',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Website',
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Location',
                  ),
                ),
              ),
              Center(
                  child: DropdownButton2(
                isExpanded: true,
                hint: Text(
                  'Assigns User',
                  style: TextStyle(
                    fontSize: 14,
                    color: Theme.of(context).hintColor,
                  ),
                ),
                items: items
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),
                value: selectedValue,
                onChanged: (value) {
                  setState(() {
                    selectedValue = value as String;
                  });
                },
              )),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 20),
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.all(16.0),
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'submit',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ]),
          ),
        ));
  }
}
