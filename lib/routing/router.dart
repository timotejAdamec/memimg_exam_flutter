import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/views/privacy/privacy_view.dart';
import 'package:flutter_poznavacka/views/exam/exam_view.dart';
import 'package:flutter_poznavacka/views/home/home_view.dart';

import 'route_names.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return MaterialPageRoute(builder: (_) => HomeView());
      case PrivacyRoute:
        return MaterialPageRoute(builder: (_) => PrivacyView());
      case ExamRoute:
        print("pin_ExamRoute_Router = " + settings.arguments);
        return MaterialPageRoute(
            builder: (_) => ExamView(pin: settings.arguments));
      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                      child: Text('No route defined for ${settings.name}')),
                ));
    }
  }
}

/*
class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomeRoute:
        return _getPageRoute(HomeView(), settings);
      case PrivacyRoute:
        return _getPageRoute(PrivacyView(), settings);
      case ExamRoute:
        return _getPageRoute(ExamView(), settings);
      default:
        return _getPageRoute(HomeView(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget child;
  final String routeName;
  _FadeRoute({this.child, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
            ) =>
                child,
            transitionsBuilder: (
              BuildContext context,
              Animation<double> animation,
              Animation<double> secondaryAnimation,
              Widget child,
            ) =>
                FadeTransition(opacity: animation, child: child));
}*/
