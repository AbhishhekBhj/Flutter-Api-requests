import 'dart:convert';
import 'dart:developer';

import 'package:blocapirequests/features/posts/models/post_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {
  static Future<List<PostModel>> fetchPostModel() async {
    var client = http.Client();
    List<PostModel> posts = [];

    try {
      var response = await client
          .get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));

      List resultList = jsonDecode(response.body);

      for (int i = 0; i < resultList.length; i++) {
        PostModel post =
            PostModel.fromMap(resultList[i] as Map<String, dynamic>);
        posts.add(post);
      }
      return posts;
    } catch (e) {
      log(e.toString());
      return [];
    }
  }

  static Future<bool> addPost() async {
    var client = http.Client();

    try {
      var response = await client
          .post(Uri.parse("https://jsonplaceholder.typicode.com/posts"), body: {
        "title": "This data is hardcoded",
        "body": "This data will later be obtained from a form",
        "userId": "1"
      });

      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      log(e.toString());
      return false;
    }
  }
}
