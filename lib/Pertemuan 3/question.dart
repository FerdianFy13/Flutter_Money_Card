import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Question extends StatelessWidget {
  String textQuestion;
  Question(this.textQuestion);

  @override
  Widget build(BuildContext context) {
    return Text(
      textQuestion,
      style: TextStyle(
        fontSize: 30,
        color: Color.fromARGB(255, 205, 92, 92),
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
