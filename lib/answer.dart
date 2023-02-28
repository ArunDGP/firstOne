import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final selectHandler;
  String answerText;
  Answer(this.selectHandler, this.answerText); //stores whatever get in

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: selectHandler,
        child: Text(
          answerText,
          style: TextStyle(
              color: Colors.green.shade800,
              fontWeight: FontWeight.w700,
              fontSize: 29),
        ),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.orange)),
      ),
    );
  }
}
