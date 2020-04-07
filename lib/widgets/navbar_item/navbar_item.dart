import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import 'navbar_item_desktop.dart';
import 'navbar_item_mobile.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  const NavBarItem(this.title, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          locator<NavigationService>().navigateTo(navigationPath);
        },
        child: ScreenTypeLayout(
          tablet: NavBarItemTabletDesktop(
            model: model,
          ),
          mobile: NavBarItemMobile(
            model: model,
          ),
        ));
  }
}
