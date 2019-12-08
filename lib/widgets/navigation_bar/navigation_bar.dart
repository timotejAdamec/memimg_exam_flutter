import 'package:flutter/material.dart';

class NavigationBar extends StatelessWidget {
  const NavigationBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            SizedBox(
                height: 100,
                width: 100,
                child: Image.asset('assets/poznavacka_logo.png')),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                _NavBarItem('Log in'),
                SizedBox(
                  width: 60,
                ),
                _NavBarItem('About'),
              ],
            )
          ],
        ));
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  const _NavBarItem(this.title);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w500),
    );
  }
}
