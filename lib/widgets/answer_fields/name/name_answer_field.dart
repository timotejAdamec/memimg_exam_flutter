import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'name_answer_field_mobile.dart';
import 'name_anwser_field_tablet_dekstop.dart';

class NameAnswerField extends StatelessWidget {
  final String answerName;
  const NameAnswerField(
    this.answerName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NameAnswerFieldMobile(answerName),
      desktop: NameAnswerFieldTabletDesktop(answerName),
    );
  }
}
