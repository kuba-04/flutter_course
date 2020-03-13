import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Result extends StatelessWidget {
  final int totalScore;
  final Function resetQuiz;

  Result(this.totalScore, this.resetQuiz);

  String get resultPhrase {
    var resultText = 'You did it!';
    if (totalScore <= 8) {
      resultText = 'Awesome';
    } else if (totalScore <= 12) {
      resultText = 'Likeable!';
    } else {
      resultText = 'You are strange!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Restart Quiz?!'),
            onPressed: resetQuiz,
            )
        ],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
  }
}
