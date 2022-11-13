import 'package:flutter/material.dart';

class User extends StatefulWidget {
  const User({Key? key}) : super(key: key);

  @override
  State<User> createState() => _UserState();
}

class _UserState extends State<User> {
  TextEditingController name = TextEditingController();
  TextEditingController passwords = TextEditingController();
  TextEditingController dateCtl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size.width;
    MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          resizeToAvoidBottomInset: false,
          body: Padding(
            padding: const EdgeInsets.all(15),
            child: SingleChildScrollView(
              child: Column(children: <Widget>[
                const Text(
                  'Create User',
                  style: TextStyle(color: Colors.black, fontSize: 45),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: name,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'User Name',
                      hintText: 'Enter Your Name',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: TextField(
                    controller: passwords,
                    obscureText: true,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Password',
                      hintText: 'Enter Password',
                    ),
                  ),
                ),
                Column(
                  children: [
                    const Padding(padding: EdgeInsets.all(14.0)),
                    TextFormField(
                      obscureText: true,
                      controller: dateCtl,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Date of birth",
                        hintText: "Ex. Insert your dob",
                      ),
                      onTap: () async {
                        DateTime date = DateTime(1900);
                        FocusScope.of(context).requestFocus(FocusNode());

                        dateCtl = (await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1900),
                            lastDate: DateTime(2100))) as TextEditingController;

                        dateCtl.text = date.toIso8601String();
                      },
                    )
                  ],
                ),
                const SizedBox(
                  height: 45,
                  width: 34,
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
                TextButton(
                  style: TextButton.styleFrom(
                    textStyle: const TextStyle(fontSize: 20),
                    backgroundColor: Colors.blue,
                    padding: const EdgeInsets.all(16.0),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Back',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ]),
            ),
          )),
    );
  }
}
