import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/widgets/call_to_action/call_to_action.dart';
import 'package:flutter_poznavacka/widgets/centered_view/centered_view.dart';
import 'package:flutter_poznavacka/widgets/course_details/course_details.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF50808E),
      body: CenteredView(
        child: Column(
          children: <Widget>[
            NavigationBar(),
            Expanded(
              child: Row(
                children: <Widget>[
                  CourseDetails(),
                  Expanded(
                      child: Center(
                    child: CallToAction('TEST NOW'),
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
