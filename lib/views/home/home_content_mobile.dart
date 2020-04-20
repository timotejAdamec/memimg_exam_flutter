import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/widgets/call_to_action/call_to_action.dart';
import 'package:flutter_poznavacka/widgets/course_details/course_details.dart';

class HomeContentMobile extends StatelessWidget {
  const HomeContentMobile({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Expanded(child: Center(child: CourseDetails())),
        /* SizedBox(
          height: 100,
        ),
        CallToAction('Join Exam'),*/
        Expanded(
            child: Center(
          child: CallToAction('Join Exam'),
        ))
      ],
    );
  }
}
