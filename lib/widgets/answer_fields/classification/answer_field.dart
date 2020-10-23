import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'answer_field_mobile.dart';
import 'anwser_field_tablet_dekstop.dart';

class ClassificationAnswerField extends StatelessWidget {
  final int representativeIndex;
  final int answerIndex;
  final String answerName;
  final String correctAnswer;
  const ClassificationAnswerField(
    this.representativeIndex,
    this.answerIndex,
    this.answerName,
    this.correctAnswer, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AnswerFieldMobile(
          representativeIndex, answerIndex, answerName, correctAnswer),
      desktop: AnswerFieldTabletDesktop(
          representativeIndex, answerIndex, answerName, correctAnswer),
    );
  }
}
