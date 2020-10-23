import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/views/exam/exam_view.dart';

class NameAnswerFieldMobile extends StatefulWidget {
  final int representativeIndex;
  final String answerName;
  NameAnswerFieldMobile(
    this.representativeIndex,
    this.answerName, {
    Key key,
  }) : super(key: key);
  @override
  _NameAnswerFieldMobileState createState() => _NameAnswerFieldMobileState();
}

class _NameAnswerFieldMobileState extends State<NameAnswerFieldMobile> {
  bool answered = false;
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    void setAsAnswered() {
      ExamView.answers[widget.representativeIndex][0] = widget.answerName;
      myController.text = widget.answerName;
      setState(() {
        answered = true;
      });
    }

    //first appearance check
    if (ExamView.answers[widget.representativeIndex][0] != null) {
      myController.text = ExamView.answers[widget.representativeIndex][0];
      if (widget.answerName == myController.text) {
        setAsAnswered();
      }
    }

    //user input check
    myController.addListener(() {
      ExamView.answers[widget.representativeIndex][0] = myController.text;
      if (myController.text.toLowerCase().trim() ==
          widget.answerName.toLowerCase().trim()) {
        setAsAnswered();
      }
    });

    return Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: SizedBox(
          //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
          height: 40,
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
        ));
  }
}
