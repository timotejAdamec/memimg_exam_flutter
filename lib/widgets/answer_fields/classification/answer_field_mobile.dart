import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/views/exam/exam_view.dart';

class AnswerFieldMobile extends StatefulWidget {
  final int representativeIndex;
  final int answerIndex;
  final String answerName;
  final String correctAnswer;
  const AnswerFieldMobile(
    this.representativeIndex,
    this.answerIndex,
    this.answerName,
    this.correctAnswer, {
    Key key,
  }) : super(key: key);
  _AnswerFieldMobileState createState() => _AnswerFieldMobileState();
}

class _AnswerFieldMobileState extends State<AnswerFieldMobile> {
  bool answered = false;
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    void setAsAnswered() {
      ExamView.answers[widget.representativeIndex][widget.answerIndex] =
          widget.correctAnswer;
      myController.text = widget.correctAnswer;
      setState(() {
        answered = true;
      });
    }

    //first appearance check
    if (ExamView.answers[widget.representativeIndex][widget.answerIndex] !=
        null) {
      myController.text =
          ExamView.answers[widget.representativeIndex][widget.answerIndex];
      if (widget.correctAnswer == myController.text) {
        setAsAnswered();
      }
    }

    //user input check
    myController.addListener(() {
      ExamView.answers[widget.representativeIndex][widget.answerIndex] =
          myController.text;
      if (myController.text.toLowerCase().trim() ==
          widget.correctAnswer.toLowerCase().trim()) {
        setAsAnswered();
      }
    });

    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: SizedBox(
        //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                child: Center(
                  child: Text(
                    widget.answerName,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: colorAccent,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Center(
                  child: TextField(
                    readOnly: answered,
                    controller: myController,
                    textInputAction: TextInputAction.go,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Enter Answer',
                      hintStyle: TextStyle(
                        color: Colors.grey,
                      ),
                      border: InputBorder.none,
                    ),
                    style: TextStyle(
                        color: colorPrimaryDark,
                        textBaseline: TextBaseline.alphabetic),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                  color: (answered) ? Colors.green : Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
