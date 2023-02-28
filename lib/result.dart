import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final VoidCallback resetHandler;

  Result(this.resetHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Center(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          child: Text(
            'You did it..!',
            style: TextStyle(color: Colors.teal, fontSize: 50),
          ),
        ),
        ElevatedButton(onPressed: resetHandler, child: Text('Back to First')),
      ],
    )));
  }
}
