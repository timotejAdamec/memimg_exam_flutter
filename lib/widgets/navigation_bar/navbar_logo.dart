import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
          mobile: SizedBox(
          height: 80,
          width: 80,
          child: Image.asset('assets/poznavacka_logo.png')),
          desktop: SizedBox(
            height: 110,
            width: 110,
            child: Image.asset('assets/poznavacka_logo.png')
          ),
    );
  }
}
