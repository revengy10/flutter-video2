import 'package:flutter/material.dart';
import 'package:flutter_application_2/myHomePage.dart';

class LoginPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text('Hello World!')),body: Body());
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  String name = "";
  TextEditingController controller = TextEditingController();

  void click() {
    this.name = controller.text;
    Navigator.push(
      context, MaterialPageRoute(builder: (context) => MyHomePage(this.name)));
  }

  @override
  Widget build(BuildContext context) {
    return Align(alignment: Alignment.center, 
    child: Padding(
      padding: EdgeInsets.all(10), 
      child: TextField(
      controller: this.controller, 
      decoration: InputDecoration(
      prefixIcon: Icon(Icons.person),
      labelText: "Type Your Name:", 
      border: OutlineInputBorder(borderSide: BorderSide(width: 5, color: Colors.black)),
      suffixIcon: IconButton(
        icon: Icon(Icons.done), 
        splashColor: Colors.green,
        tooltip: "Submit",
        onPressed: this.click,
      )),
      ),
      ),);
  }
}