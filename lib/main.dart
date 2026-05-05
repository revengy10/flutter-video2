import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: .fromSeed(seedColor: const Color.fromARGB(255, 93, 0, 255)),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(appBar: AppBar(
  title: const Text('Hello World'),
  backgroundColor: Colors.orange, // Arka planı turuncu yapar
  foregroundColor: Colors.white,  // İçindeki yazının rengini beyaz yapar
),
    body: Row(
      children: <Widget>[TestWidget(), TestWidget(), TestWidget()], ));
  }
} 

class TestWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello World!');
  }
}