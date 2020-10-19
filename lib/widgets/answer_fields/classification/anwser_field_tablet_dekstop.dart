import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';

class AnswerFieldTabletDesktop extends StatelessWidget {
  final String answerName;
  const AnswerFieldTabletDesktop(
    this.answerName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.only(top: 8.0, left: 30, right: 30),
      child: SizedBox(
        //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
        height: 70,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                child: Center(
                  child: Text(
                    answerName,
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
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(10),
                    )),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Center(
                  child: TextField(
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
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.only(topRight: Radius.circular(10))),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
