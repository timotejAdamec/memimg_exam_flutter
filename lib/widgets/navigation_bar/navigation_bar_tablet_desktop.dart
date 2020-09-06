import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/widgets/navbar_item/navbar_item.dart';
import 'navbar_logo.dart';

class NavigationBarTabletDesktop extends StatelessWidget {
  const NavigationBarTabletDesktop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          NavBarLogo(),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              /*NavBarItem('Why'),
              SizedBox(
                width: 60,
              ),*/
              NavBarItem(
                'Privacy',
                PrivacyRoute,
                icon: (Icon(
                  Icons.help,
                  color: Colors.white,
                )),
              ),
            ],
          )
        ],
      ),
    );
  }
}
