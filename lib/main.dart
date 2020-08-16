import 'package:flutter/material.dart';

class QuizQuestion {
  String question;
  List<String> answers;
  int correctAnswerIndex;
  QuizQuestion({this.question, this.answers, this.correctAnswerIndex});
  QuizQuestion.unamedArgs(this.question, this.answers, this.correctAnswerIndex);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final isPressed = [false, false, false, false];
  final questions = [
    QuizQuestion.unamedArgs("Answer index 0", ["0", "1", "2", "3"], 0),
    QuizQuestion.unamedArgs("Answer index 3",
        ["Yes", "Yes again", "Yes but more true", "Yes, and correct anser"], 3),
  ];
  final currentQuestion = 1;
  void answerQuestion(int index) {
    print("pressed");
    isPressed[index] = true;
    print(isPressed[index]);
  }

  List<Widget> buildQuizSection(QuizQuestion quizQuestion) {
    return [
      Text(quizQuestion.question),
      ...quizQuestion.answers.asMap().entries.map(
            (MapEntry entry) => RaisedButton(
                child: Text(entry.value),
                onPressed: isPressed[entry.key]
                    ? null
                    : () => answerQuestion(entry.key)),
          )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello world"),
        ),
        body: Column(
          children: buildQuizSection(questions[currentQuestion]),
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
        ),
      ),
    );
  }
}
