import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';

import '../../services/locator.dart';
import '../../routing/route_names.dart';
import '../../services/navigation_service.dart';

class NavigationDrawerHeader extends StatelessWidget {
  const NavigationDrawerHeader({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Scaffold.of(context).openEndDrawer();
        locator<NavigationService>().navigateTo(HomeRoute);
      },
      child: Container(
        height: 150,
        color: colorAccent,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Got the PIN?',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                    color: Colors.white)),
            Text(
              'Join now!',
              style: TextStyle(color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
