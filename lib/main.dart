import 'package:blocapirequests/features/posts/ui/post_page.dart';
import 'package:flutter/material.dart';

void main(List<String> args) async {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: PostPage());
  }
}
