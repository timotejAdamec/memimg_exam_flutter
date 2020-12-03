import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/navbar_item_model.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:responsive_builder/responsive_builder.dart';

import '../../locator.dart';
import 'navbar_item_desktop.dart';
import 'navbar_item_mobile.dart';

class NavBarItem extends StatelessWidget {
  final String title;
  final String navigationPath;
  final Icon icon;
  const NavBarItem(this.title, this.navigationPath, {this.icon});

  @override
  Widget build(BuildContext context) {
    var model = NavBarItemModel(
      title: title,
      navigationPath: navigationPath,
      icon: icon,
    );
    return GestureDetector(
        onTap: () {
          // DON'T EVER USE A SERVICE DIRECTLY IN THE UI TO CHANGE ANY KIND OF STATE
          // SERVICES SHOULD ONLY BE USED FROM A VIEWMODEL
          locator<NavigationService>().navigateTo(navigationPath);
          Scaffold.of(context).openEndDrawer();
        },
        child: Provider.value(
          value: model,
          child: ScreenTypeLayout(
            tablet: NavBarItemTabletDesktop(),
            mobile: NavBarItemMobile(),
          ),
        ));
  }
}
