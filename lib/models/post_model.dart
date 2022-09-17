// To parse this JSON data, do
//
//     final post = postFromJson(jsonString);

import 'dart:convert';

Post postFromJson(String str) => Post.fromJson(json.decode(str));

String postToJson(Post data) => json.encode(data.toJson());

class Post {
    Post({
        required this.userId,
        required this.title,
        required this.body,
    });

    int userId;
    String title;
    String body;

    factory Post.fromJson(Map<String, dynamic> json) => Post(
        userId: json["userId"],
        title: json["title"],
        body: json["body"],
    );

    Map<String, dynamic> toJson() => {
        "userId": userId,
        "title": title,
        "body": body,
    };
}
