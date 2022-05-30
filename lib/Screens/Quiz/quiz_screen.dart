import 'package:flutter/material.dart';
import './quiz_data.dart';
import './quiz.dart';
import './result.dart';
import '../../constants.dart';

void main() => runApp(QuizScreen());

class QuizScreen extends StatefulWidget {
  final String? course;
  const QuizScreen({Key? key, this.course}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _QuizScreenState();
  }
}

class _QuizScreenState extends State<QuizScreen> {
  late var _questions;

  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });
    print(_questionIndex);
    if (_questionIndex < 5) {
      print('We have more questions!');
    } else {
      print('No more questions!');
    }
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as QuizScreen;
    final totalQues = quizData[args.course];
    final shuffleQues = totalQues?.toList()?..shuffle();
    _questions = shuffleQues?.sublist(1, 6);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Quick Quiz'),
        backgroundColor: quiz1,
      ),
      body: Padding(
        padding: const EdgeInsets.all(21.0),
        child: _questionIndex < 5
            ? Quiz(
                answerQuestion: _answerQuestion,
                questionIndex: _questionIndex,
                questions: _questions,
              ) //Quiz
            : Result(_totalScore, _resetQuiz),
      ), //Padding
    ); //Scaffold/MaterialApp
  }
}
