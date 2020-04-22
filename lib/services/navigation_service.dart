import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/exam_enter_info.dart';

class NavigationService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState.pushNamed(routeName);
  }

  Future<dynamic> navigateToWithExamInfo(
      String routeName, ExamEnterInfo examEnterInfo) {
    return navigatorKey.currentState
        .pushNamed(routeName, arguments: examEnterInfo);
  }

  void goBack() {
    navigatorKey.currentState.pop();
  }
}
