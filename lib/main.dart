// ignore: avoid_web_libraries_in_flutter
// ignore_for_file: unused_import, avoid_print

// ignore: avoid_web_libraries_in_flutter
import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/ProfileScreen.dart';
import 'package:project/admin.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:project/files.dart';
import 'package:project/userapi.dart';
import 'package:project/web.dart';

void main() {
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   
    return  const MaterialApp(
      
       debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<FirebaseApp> _initializeFirebase() async {
    FirebaseApp firebaseApp = await Firebase.initializeApp();
    return firebaseApp;
  }

  @override
  Widget build(BuildContext context) {
    return 
       Scaffold(
        resizeToAvoidBottomInset: false,
        body: FutureBuilder(
            future: _initializeFirebase(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return const LoginScreen();
              }
              return const Center(
                child: CircularProgressIndicator(),
              );
            }), 
      
    );
  }
}

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

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
  static Future<User?> loginusingEmailpassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user not found") {
        print("no user not found for the email");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
     MediaQuery.of(context).size.width;
     MediaQuery.of(context).size.height;
    TextEditingController email = TextEditingController();
    TextEditingController password = TextEditingController();
    return 
    Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
             const Text('Project',style: TextStyle(color: Colors.black,fontSize: 35),),
              const SizedBox(
                height: 44,
                width: 12,
              ),Row(
                mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                    
                    CircleAvatar(
                      maxRadius: 45,
                      backgroundImage:NetworkImage("https://thumbs.dreamstime.com/b/logo-maserati-car-color-vector-format-aviable-ai-logo-maserati-124367517.jpg"),
                       child: Text('sibijoe',style: TextStyle(color: Colors.black,fontSize: 5),),
                     )
                   ],
              ),
              SizedBox(
                height:12,
                width: 13,
              ),
             
              TextField(
                obscureText: true,
                controller: email,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Username',
                    hintText: 'Enter the username',
                    prefixIcon: Icon(Icons.mark_email_unread_outlined)),
              ),
              const SizedBox(height: 10,width: 10,),
              TextField(
                controller: password,
                obscureText: true,
                decoration: const InputDecoration(
                border: OutlineInputBorder(),
                    labelText: 'Password',
                    hintText: 'Enter the Password',
                    prefixIcon: Icon(Icons.lock)),
              ),
              Container(
                width: double.infinity,
                child: RawMaterialButton(
                  
                  elevation: 0.0,
                  shape: RoundedRectangleBorder(
                    borderRadius:BorderRadius.circular(12.0)
                  ),
                  
                  onPressed:()async{
                  User? user=await loginusingEmailpassword(email: email.text,password: password.text context: context);
                  print(user);
                  if(user !=null){
                    Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>const ProfileScreen()));
                  
                  }
                           
          },child: const Text('sigin'),
          ),
        
              ),
              TextButton(
                
                
                style: TextButton.styleFrom(
                
                  textStyle: const TextStyle(fontSize: 10),
                  backgroundColor: Colors.black,
                  padding: const EdgeInsets.symmetric(),
                ),
                onPressed: ()
                 
                 async{
                  User? user=await loginusingEmailpassword(email: email.text,password: password.text context: context);
                  print(user);
                  if(user !=null){
                    Navigator.of(context).pushReplacement( MaterialPageRoute(builder: (context)=>const ProfileScreen()));
                  
                  }
                
                }, child: const Text('login'), 

                
        
                
          ),TextButton(onPressed:() {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Web()),
  );
} , child: const Text('login'))]),
          
          ),
        );
          
        
  }
}
