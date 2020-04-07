import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navbar_logo.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar_mobile.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar_tablet_desktop.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:flutter_poznavacka/widgets/navbar_item/navbar_item.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: NavigationBarMobile(),
      tablet: NavigationBarTabletDesktop(),
    );
  }
}