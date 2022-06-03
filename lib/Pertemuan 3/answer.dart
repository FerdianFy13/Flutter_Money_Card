import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function textAnswer;
  final String answerQuestion;
  Answer(
    this.textAnswer,
    this.answerQuestion,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(0, 7, 0, 7),
      // ignore: deprecated_member_use
      child: RaisedButton(
        autofocus: false,
        color: Colors.orange.shade800,
        clipBehavior: Clip.antiAlias,
        child: Text(
          answerQuestion,
          style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
        ),
        onPressed: textAnswer,
      ),
    );
  }
}
