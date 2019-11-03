import 'dart:math';
import 'package:first_flutter_app/Data/QuizData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'MasterPage.dart';

QuizData quizData = QuizData();

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Icon> answerIconList = [];
  String question = quizData.getQuizQuestion();

  updateAnswer(bool answer) {
    setState(() {
      if (!quizData.quizFinished()) {
        if (quizData.checkQuizAnswer(answer)) {
          answerIconList.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
        } else {
          answerIconList.add(Icon(
            Icons.clear,
            color: Colors.red,
          ));
        }
        quizData.nextQuestion();
        question = quizData.getQuizQuestion();
      } else {
        Alert(
          context: context,
          type: AlertType.error,
          title: "Quiz Alert",
          desc: "Quiz Succssefully finishe!",
          buttons: [
            DialogButton(
              child: Text(
                "Restart",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              onPressed: () {
                setState(() {
                  quizData.restQuiz();
                  Navigator.pop(context);
                  answerIconList = [];
                  question = quizData.getQuizQuestion();
                });
              },
              width: 120,
            )
          ],
        ).show();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MasterPage(
      appBarText: 'Quizlet',
      scaffoldBody: Container(
        child: Container(
          padding: EdgeInsets.all(10),
          width: double.maxFinite,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Text(
                  question,
                  style: TextStyle(fontSize: 22),
                ),
              ),
              new PaddedColoredButton(
                buttonText: 'True',
                buttonColor: Colors.green,
                updateAnswer: () {
                  updateAnswer(true);
                },
              ),
              new PaddedColoredButton(
                buttonText: 'False',
                buttonColor: Colors.red,
                updateAnswer: () {
                  updateAnswer(false);
                },
              ),
              Expanded(
                child: Row(
                  children: answerIconList,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: null,
    );
  }
}

class PaddedColoredButton extends StatelessWidget {
  final Color buttonColor;
  final String buttonText;
  final Color buttonTextColor;
  final Function updateAnswer;

  const PaddedColoredButton({
    @required this.buttonText,
    @required this.buttonColor,
    @required this.updateAnswer,
    this.buttonTextColor = Colors.white,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FlatButton(
          onPressed: updateAnswer,
          color: buttonColor,
          child: Text(
            buttonText,
            style: TextStyle(
              color: buttonTextColor,
              fontSize: 20.0,
            ),
          ),
        ),
      ),
    );
  }
}
