import 'package:flutter/material.dart';

import 'answer_field.dart';

class ListAnswerFields extends StatelessWidget {
  final List infoArr;
  const ListAnswerFields(
    this.infoArr, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(children: answerFields());
  }

  answerFields() {
    List<Widget> arr = new List();
    infoArr.forEach((element) {
      arr.add(AnswerField(element));
    });
    return arr;
  }
}
