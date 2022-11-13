import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const Web());
}

class Web extends StatelessWidget {
  const Web({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Webpage',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Gfg TextButton Demo"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 35),
              child: Image.network(
                  "https://media.geeksforgeeks.org/wp-content/uploads/20220112153639/gfglogo-300x152.png"),
            ),
            TextButton(
              child: Text(
                "Visit GeeksforGeeks",
                style: TextStyle(fontSize: 25),
              ),
              onPressed: () async {
                const String _url = "https://www.javatpoint.com/";
                if (await canLaunch(_url)) {
                  launch(_url);
                } else {
                  throw "Could not launch $_url";
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
