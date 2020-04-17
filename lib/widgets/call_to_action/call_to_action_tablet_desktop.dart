import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';

import '../../locator.dart';

class CallToActionTabletDesktop extends StatelessWidget {
  final String title;
  const CallToActionTabletDesktop(this.title);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      width: 270,
      height: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.only(left: 15, right: 15, top: 5),
              child: Center(
                child: TextField(
                  textInputAction: TextInputAction.go,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      hintText: 'Enter PIN',
                      hintStyle: TextStyle(color: Colors.grey),
                      border: InputBorder.none,
                      ),
                  style: TextStyle(color: colorPrimaryDark, textBaseline: TextBaseline.alphabetic),
                  textAlign: TextAlign.center,
                ),
              ),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5))),
            ),
          ),
          Expanded(
            flex: 5,
            child: GestureDetector(
              onTap: () {
                locator<NavigationService>().navigateTo(ExamRoute);
              },
              child: Container(
                child: Center(
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w800,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                decoration: BoxDecoration(
                    color: colorAccent,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(5),
                        bottomRight: Radius.circular(5))),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
