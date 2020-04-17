import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/widgets/navbar_item/navbar_item.dart';

class DrawerItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final String navigationPath;
  const DrawerItem(this.title, this.icon, this.navigationPath);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(
            icon,
            color: Colors.white,
          ),
          SizedBox(width: 30),
          NavBarItem(title, navigationPath)
        ],
      ),
    );
  }
}
