import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'name_answer_field_mobile.dart';
import 'name_anwser_field_tablet_dekstop.dart';

class NameAnswerField extends StatelessWidget {
  final int representativeIndex;
  final String answerName;
  const NameAnswerField(
    this.representativeIndex,
    this.answerName, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NameAnswerFieldMobile(representativeIndex, answerName),
      desktop: NameAnswerFieldTabletDesktop(representativeIndex, answerName),
    );
  }
}
