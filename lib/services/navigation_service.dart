import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/exam_enter_info.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithExamInfo(String routeName, String pin) {
    debugPrint("pin_navigation_service = " + pin);
    return navigatorKey.currentState.pushNamed(routeName, arguments: pin);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
