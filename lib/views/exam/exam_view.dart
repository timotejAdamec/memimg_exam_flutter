import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/widgets/representative_details/representative_details.dart';

class ExamView extends StatefulWidget {
  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  PageController controller = PageController();
  var currentPageValue = 0.0;

  @override
  Widget build(BuildContext context) {
    List listOfArrs = new List();
    List images = new List();

    List infoArr = new List();
    infoArr.add("Slon");
    infoArr.add("chobotnatci");

    List infoArr1 = new List();
    infoArr1.add("Slon1");
    infoArr1.add("chobotnatci1");

    List elseInfoArr = new List();
    elseInfoArr.add("Else!");
    elseInfoArr.add("Else!!");
    elseInfoArr.add("Else!!!");

    listOfArrs.add(infoArr);
    listOfArrs.add(infoArr1);
    listOfArrs.add(elseInfoArr);

    images.add(
        "https://www.peva.cz/deploy/img/products/28092/vrtak_test_1_28092.png");
    images.add(
        "https://www.tutorialspoint.com/dart_programming/images/if_else_statement.jpg");
    images.add("https://m.media-amazon.com/images/I/81l00MgXNRL._SS500_.jpg");

    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

    return PageView.builder(
      controller: controller,
      itemBuilder: (context, index) {
        if (index == currentPageValue.floor()) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - index),
            child: RepresentativeDetails(
              details: RepresentativeDetailsModel(
                imageUrl: images[index],
                infoArr: listOfArrs[index],
              ),
            ),
          );
        } else if (index == currentPageValue.floor() + 1) {
          return Transform(
            transform: Matrix4.identity()..rotateX(currentPageValue - index),
            child: RepresentativeDetails(
              details: RepresentativeDetailsModel(
                imageUrl: images[index],
                infoArr: listOfArrs[index],
              ),
            ),
          );
        } else {
          return RepresentativeDetails(
            details: RepresentativeDetailsModel(
              imageUrl: images[index],
              infoArr: listOfArrs[index],
            ),
          );
        }
      },
      itemCount: 2,
    );
  }
}
