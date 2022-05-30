import 'package:flutter/material.dart';
import '../../constants.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final VoidCallback resetHandler;

  Result(this.resultScore, this.resetHandler);

  //Remark Logic
  String get resultPhrase {
    String resultText;
    if (resultScore >= 41) {
      resultText = 'You are awesome!';
      print(resultScore);
    } else if (resultScore >= 31) {
      resultText = 'Pretty likeable!';
      print(resultScore);
    } else if (resultScore >= 21) {
      resultText = 'You need to work more!';
    } else if (resultScore >= 1) {
      resultText = 'You need to work hard!';
    } else {
      resultText = 'This is a poor score!';
      print(resultScore);
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10), //Text
          Text(
            'Score ' '$resultScore',
            style: TextStyle(fontSize: 33, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 25), //Text
          Container(
            width: 135,
            decoration: BoxDecoration(
              border: Border.all(color: quiz5, width: 4),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: TextButton(
              onPressed: resetHandler,
              child: Text(
                'Restart Quiz!',
                style: TextStyle(color: quiz5),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text("OR"),
          SizedBox(height: 12),
          Container(
            width: 135,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.white, width: 3),
              borderRadius: BorderRadius.all(Radius.circular(15)),
              color: quiz6,
              shape: BoxShape.rectangle,
            ),
            child: TextButton(
              onPressed: () {
                Navigator.of(context)
                    .pushNamedAndRemoveUntil('/courses/', (route) => false);
              },
              child: Text(
                'Return',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ) //FlatButton
        ], //<Widget>[]
      ), //Column
    ); //Center
  }
}
