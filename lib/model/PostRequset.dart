class PostRequest {
  String? title;
  String? body;
  int? userId;
  PostRequest(this.body, this.title, this.userId);
  toJson() => {'title': title, 'body': body, 'userId': userId};
}
