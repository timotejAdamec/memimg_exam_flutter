import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/datamodels/exam_enter_info.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';

import '../../locator.dart';

class CallToActionMobile extends StatefulWidget {
  CallToActionMobile(
    this.title, {
    Key key,
  }) : super(key: key);
  final String title;

  @override
  _CallToActionState createState() => _CallToActionState();
}

class _CallToActionState extends State<CallToActionMobile> {
  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();

    @override
    void dispose() {
      // Clean up the controller when the widget is disposed.
      myController.dispose();
      super.dispose();
    }

    return SizedBox(
      //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
      height: 100,
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
                      border: InputBorder.none),
                  style: TextStyle(
                      color: colorPrimaryDark,
                      textBaseline: TextBaseline.alphabetic),
                  controller: myController,
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
                var pin = myController.text;
                debugPrint("pin = " + pin);
                dispose();
                locator<NavigationService>()
                    .navigateToWithExamInfo(ExamRoute, pin);
              },
              child: Container(
                child: Center(
                  child: Text(
                    this.widget.title,
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

    /* return Container(
      height: 60,
      alignment: Alignment.center,
      child: Text(
        title,
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      decoration: BoxDecoration(
          color: colorAccent, borderRadius: BorderRadius.circular(5)),
    ); */
  }
}
