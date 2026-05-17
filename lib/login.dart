import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // User sınıfı için gerekli
import 'package:flutter_application_2/myHomePage.dart';
import 'auth.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hello World!')),
      body: Body(),
    );
  }
}

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  User? user; 

  @override
  void initState() {
    super.initState();
    signOutGoogle();
  }

  void click() {
    signInWithGoogle().then((girisYapanKullanici) {
      if (girisYapanKullanici != null) {
        setState(() {
          user = girisYapanKullanici;
        });
        
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(girisYapanKullanici),
          ),
        );
      }
    });
  }

  Widget googleLoginButton() {
    return OutlinedButton(
      onPressed: click,
      style: OutlinedButton.styleFrom(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(45)),
        side: BorderSide(color: Colors.grey), // Kenarlık rengi buraya taşındı
        foregroundColor: Colors.grey, // Tıklama efekti ve yazı rengi için
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage('assets/google_logo.jpg'), height: 35),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in With Google',
                style: TextStyle(color: Colors.grey, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: googleLoginButton(),
    );
  }
}