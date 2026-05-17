import 'package:firebase_database/firebase_database.dart';
import 'post.dart';

final databaseReference = FirebaseDatabase.instance.ref();

DatabaseReference savePost(Post post){
  var id = databaseReference.child('posts/').push();
  id.set(post.toJson());
  return id;
}

void updatePost(Post post, DatabaseReference id){
  id.update(post.toJson());
}
 
Future<List<Post>> getAllMessages() async {
  DatabaseEvent event = await databaseReference.child('posts/').once();
  DataSnapshot dataSnapshot = event.snapshot;
  
  List<Post> posts = [];
  
  if (dataSnapshot.value != null) {
    Map<dynamic, dynamic> values = dataSnapshot.value as Map<dynamic, dynamic>;
    
    values.forEach((key, value) {
      Post post = createPost(value);
      post.setId(databaseReference.child('posts/' + key.toString()));
      posts.add(post);
    });
  }
  
  return posts;
}