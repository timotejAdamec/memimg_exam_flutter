import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

class CourseDetails extends StatelessWidget {
  const CourseDetails({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(builder: (context, sizingInformation) {
      var textAlignment =
          sizingInformation.deviceScreenType == DeviceScreenType.Desktop
              ? TextAlign.left
              : TextAlign.center;
      double titleSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 50
              : 80;
      double descriptionSize =
          sizingInformation.deviceScreenType == DeviceScreenType.Mobile
              ? 16
              : 21;

      return Container(
        width: 600,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'RECOG TEST.',
              style: TextStyle(
                  fontWeight: FontWeight.w800,
                  height: 0.9,
                  fontSize: titleSize),
              textAlign: textAlignment,
            ),
            Text(
              'GOOD LUCK!',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  height: 0.9,
                  fontSize: titleSize - 20),
              textAlign: textAlignment,
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed convallis magna eu semLorem ipsum dolor sit amet, consectetuer adipiscing elit. Sed convallis magna eu sem. Etiam ligula pede, sagittis quis, interdum ultricies, scelerisque eu. Integer lacinia. Nulla quis diam.",
              style: TextStyle(fontSize: descriptionSize, height: 1.7),
            )
          ],
        ),
      );
    });
  }
}
