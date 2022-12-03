import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/styles/text_styles.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.desktop
              ? TextAlign.left
              : TextAlign.center;
      /*double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 50
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.mobile
              ? 16
              : 21;*/

      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Image recognition exam.',
              style: titleTextStyle(sizingInformation.deviceScreenType),
              textAlign: textAlignment,
            ),
            /*Text(
              'Good luck!',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                  fontSize: titleSize - 20,
                  color: Colors.white),
              textAlign: textAlignment,
            ),*/
            SizedBox(
              height: 30,
            ),
            Text(
                "Join an exam by entering the pin provided by the user that started the exam (e.g. teacher)",
                style: descriptionTextStyle(sizingInformation.deviceScreenType),
                textAlign: textAlignment)
          ],
        ),
      );
    });
  }
}
