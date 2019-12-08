import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/views/home/home_content_desktop.dart';
import 'package:flutter_poznavacka/views/home/home_content_mobile.dart';
import 'package:flutter_poznavacka/widgets/call_to_action/call_to_action.dart';
import 'package:flutter_poznavacka/widgets/centered_view/centered_view.dart';
import 'package:flutter_poznavacka/widgets/course_details/course_details.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar.dart';
import 'package:responsive_builder/responsive_builder.dart';

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
                child: ScreenTypeLayout(
              mobile: HomeContentMobile(),
              desktop: HomeContentDesktop(),
            ))
          ],
        ),
      ),
    );
  }
}
