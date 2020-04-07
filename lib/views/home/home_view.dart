import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/views/home/home_content_desktop.dart';
import 'package:flutter_poznavacka/views/home/home_content_mobile.dart';
import 'package:flutter_poznavacka/widgets/call_to_action/call_to_action.dart';
import 'package:flutter_poznavacka/widgets/centered_view/centered_view.dart';
import 'package:flutter_poznavacka/widgets/course_details/course_details.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_poznavacka/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key key}) : super(key: key);

  /*@override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: colorPrimary,
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
      ),
    );
  }
}*/

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      desktop: HomeContentDesktop(),
    );
  }
}