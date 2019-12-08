import 'package:flutter/material.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => SizedBox(
      height: 110,
      width: 110,
      child: Image.asset('assets/poznavacka_logo.png'));
}
