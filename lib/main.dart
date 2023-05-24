import 'package:flutter/material.dart';
import 'package:question/pages/question/question_list_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        backgroundColor: const Color(0xffFBFAFF),
        primarySwatch: Colors.deepPurple,
      ),
      home: const QuestionListPage(),
    );
  }
}

