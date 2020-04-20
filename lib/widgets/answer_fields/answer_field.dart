import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'answer_field_mobile.dart';
import 'anwser_field_tablet_dekstop.dart';

class AnswerField extends StatelessWidget {
  final String answerName;
  const AnswerField(
    this.answerName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: AnswerFieldMobile(answerName),
      desktop: AnswerFieldTabletDesktop(answerName),
    );
  }
}
