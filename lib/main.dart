import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart'; // Core paketini ekledik
import 'login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); 
  
  await Firebase.initializeApp(); 
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Emirhan App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: LoginPage(),
    );
  }
}
