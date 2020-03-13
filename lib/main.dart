import 'package:flutter/material.dart';
import 'package:flutter_course/quiz.dart';
import 'package:flutter_course/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  static const questions = [
      {
        'questiontext': 'What\'s your favourite colour?',
        'answers': [
          {'text': 'Black', 'score': 3}, 
          {'text': 'Red', 'score': 1}, 
          {'text': 'Green', 'score': 2}, 
          {'text': 'White', 'score': 4}
        ],
      },
      {
        'questiontext': 'What\'s your favourite animal?',
        'answers': [
          {'text': 'Dog', 'score': 1},
          {'text': 'Cat', 'score': 2}, 
          {'text': 'Rabbit', 'score': 4}, 
          {'text': 'Lion', 'score': 3}
        ],
      },
      {
        'questiontext': 'What\'s your favourite movie?',
        'answers': [
          {'text': 'Movie1', 'score': 2}, 
          {'text': 'Movie2', 'score': 4}, 
          {'text': 'Movie3', 'score': 1}, 
          {'text': 'Movie4', 'score': 3}
        ],
      }
    ];
  var _questionIndex = 0;
  var _totalScore = 0;

  void _resetQuiz() {
    setState(() {
      _questionIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    if (_questionIndex < questions.length) {
      _totalScore += score;
      setState(() {
        _questionIndex = _questionIndex + 1;
      });
      print(_questionIndex);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('my app'),
          backgroundColor: Colors.teal,
        ),
        body: _questionIndex < questions.length 
          ? Quiz(answerQuestion: _answerQuestion, questionIndex: _questionIndex, questions: questions)
          : Result(_totalScore, _resetQuiz)
      ),
    );
  }
}

// https://youtu.be/x0uinJvhNxI?t=18049
