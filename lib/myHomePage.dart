import 'package:flutter/material.dart';
import 'package:flutter_application_2/database.dart';
import 'post.dart';
import 'postlist.dart';
import 'textinputwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MyHomePage extends StatefulWidget {

  final User user;
  MyHomePage(this.user);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];

void newPost(String text) {
  var post = new Post(body: text, author: widget.user.displayName ?? 'Isimsiz Kullanici');
  post.setId(savePost(post));
  this.setState(() {
    posts.add(post);
  });
}
void updateMessages() {
    getAllMessages().then((posts) => {
          this.setState(() {
            this.posts = posts;
          })
        });
  }

  @override
  void initState() {
    super.initState();
    updateMessages();
  }
@override
  Widget build(BuildContext context){
    return Scaffold(
    appBar: AppBar(title: Text('Hello World!')),
    body: Column(children: <Widget>[
    Expanded(child : PostList(this.posts, widget.user)),
    TextInputWidget(this.newPost)
    ]));
  }
}