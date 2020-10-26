import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/locator.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/routing/router.dart' as route;
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:flutter_poznavacka/widgets/centered_view/centered_view.dart';
import 'package:flutter_poznavacka/widgets/navigation_bar/navigation_bar.dart';
import 'package:flutter_poznavacka/widgets/navigation_drawer/navigation_drawer.dart';
import 'package:responsive_builder/responsive_builder.dart';

class LayoutTemplate extends StatelessWidget {
  final Widget child;
  const LayoutTemplate({Key key, @required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) => Scaffold(
        drawer: sizingInformation.deviceScreenType == DeviceScreenType.Mobile
            ? NavigationDrawer()
            : null,
        backgroundColor: colorPrimary,
        body: CenteredView(
          child: Column(
            children: <Widget>[
              NavigationBar(),
              Expanded(
                /*child: Navigator(
                  key: locator<NavigationService>().navigatorKey,
                  onGenerateRoute: route.Router.generateRoute,
                  initialRoute: HomeRoute,
                ),*/
                child: child,
              )
            ],
          ),
        ),
      ),
    );
  }
}
