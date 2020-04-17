import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/locator.dart';
import 'package:flutter_poznavacka/views/layout_template/layout_template.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Memimg',
        theme: ThemeData(
            primarySwatch: Colors.blue,
            textTheme: Theme.of(context)
                .textTheme
                .apply(fontFamily: 'lineto circular')),
        home: LayoutTemplate());
  }
}