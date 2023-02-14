import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_drum_machine/assets/questions.dart';
import 'package:flutter_drum_machine/components/icons.dart';

void main() => runApp(InfoTest());

class InfoTest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Colors.indigo[700],
            body: SafeArea(
                child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.0),
              child: QuestionPage(),
            ))));
  }
}

class QuestionPage extends StatefulWidget {
  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  List<Widget> Answers = [];

  QuestionsList Questions = new QuestionsList();

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Text is over'),
          content: SingleChildScrollView(
            child: ListBody(
              children: const <Widget>[
                Text('Would you want to go back the questions.'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: const Text('Approve'),
              onPressed: () {
                setState(() {
                  Answers = [];
                  Questions.resetIndex();
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void buttonsControl(int buttonNumber) {
    Questions.isOver() == true
        ? _showMyDialog()
        : setState(() {
            Questions.getQuestionAnswer() == buttonNumber
                ? Answers.add(rightIcon)
                : Answers.add(wrongIcon);
            Questions.indexPlus();
          });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                Questions.getQuestionText(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: Wrap(
            children: Answers,
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
          ),
        ),
        Divider(),
        Expanded(
          flex: 1,
          child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 6.0),
              child: Row(children: <Widget>[
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 209, 42, 80),
                              padding: EdgeInsets.all(12),
                              textStyle: TextStyle(color: Colors.black87)),
                          child: Icon(Icons.thumb_down, size: 30.0),
                          onPressed: () {
                            buttonsControl(0);
                          },
                        ))),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6),
                        child: TextButton(
                          style: TextButton.styleFrom(
                              backgroundColor:
                                  Color.fromARGB(255, 74, 202, 127),
                              padding: EdgeInsets.all(12),
                              textStyle: TextStyle(color: Colors.black87)),
                          child: Icon(Icons.thumb_up, size: 30.0),
                          onPressed: () {
                            buttonsControl(1);
                          },
                        ))),
              ])),
        )
      ],
    );
  }
}
