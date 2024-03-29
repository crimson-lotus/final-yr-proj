import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  final String questionText;

  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 7, bottom: 10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 21),
        textAlign: TextAlign.center,
      ), //Text
    ); //Container
  }
}
