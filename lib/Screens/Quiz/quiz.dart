import 'package:flutter/material.dart';

import './answer.dart';
import './question.dart';

class Quiz extends StatelessWidget {
  final List<Map<String, Object?>> questions;
  final int questionIndex;
  final Function answerQuestion;

  Quiz({
    Key? key,
    required this.questions,
    required this.answerQuestion,
    required this.questionIndex,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String img = questions[questionIndex]['img'] as String;
    return SingleChildScrollView(
      child: Column(
        children: [
          Question(
            questions[questionIndex]['questionText'] as String,
          ),
          img != ''
              ? Column(
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Center(
                      child: Image.asset(
                        img,
                        height: 150,
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                  ],
                )
              : SizedBox(),
          ...(questions[questionIndex]['answers'] as List<Map<String, Object>>)
              .map((answer) {
            return Answer(() => answerQuestion(answer['score']),
                answer['text'] as String);
          }).toList()
        ],
      ),
    ); //Column
  }
}
