import 'package:flutter/material.dart';
import 'package:question/pages/question/quiz_page.dart';
import 'package:question/pages/question/widgets/question_item_widget.dart';

class QuestionListPage extends StatefulWidget {
  const QuestionListPage({Key? key}) : super(key: key);

  @override
  State<QuestionListPage> createState() => _QuestionListPageState();
}

class _QuestionListPageState extends State<QuestionListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 113,
        backgroundColor: const Color(0xff5B21B6),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return QuestionItemWidget(
            title: 'question item $index',
            subTitle: 'subText for question item $index',
            onItemClick: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) {
                  return const QuizPage();
                },
              ));
            },
          );
        },
        padding: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 24,
        ),
        itemCount: 4,
      ),
    );
  }
}
