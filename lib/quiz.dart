import 'package:flutter/material.dart';
import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final int questionindex;
  final List<dynamic> questions;

  Quiz(
    this.questions,
    this.answerQuestion,
    this.questionindex,
  );
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Question(questions[questionindex]['questionText']),
        ...(questions[questionindex]['answers'] as List<dynamic>).map((answer) {
          return Answer(() => answerQuestion(answer['score']), answer['text']);
        })
      ],
    ));
  }
}
