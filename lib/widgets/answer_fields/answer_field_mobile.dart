import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';

class AnswerFieldMobile extends StatelessWidget {
  final String answerName;
  const AnswerFieldMobile(
    this.answerName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: Container(
                padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
                child: Center(
                  child: TextField(
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
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}