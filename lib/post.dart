class Post {
  String body;
  String author;
  int likes = 0;
  bool userLiked = false;
  
  Post({required this.body, required this.author});

  void likePost() {
    this.userLiked = !this.userLiked;
    if(this.userLiked) {
      this.likes += 1;
    } else{
      this.likes -= 1;
    }
  }
}