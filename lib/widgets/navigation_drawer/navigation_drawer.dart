import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/widgets/navbar_item/navbar_item.dart';
import 'package:flutter_poznavacka/widgets/navbar_item/navbar_item.dart';
import 'package:flutter_poznavacka/widgets/navigation_drawer/drawer_item.dart';
import 'package:flutter_poznavacka/widgets/navigation_drawer/navigation_drawer_header.dart';

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: colorPrimary,
          boxShadow: [BoxShadow(color: colorPrimaryDark, blurRadius: 16)]),
      child: Column(
        children: <Widget>[
          NavigationDrawerHeader(),
          //DrawerItem('Why', Icons.question_answer),
          DrawerItem('About', Icons.help, AboutRoute),
          NavBarItem(
            'About',
            AboutRoute,
          )
        ],
      ),
    );
  }
}
