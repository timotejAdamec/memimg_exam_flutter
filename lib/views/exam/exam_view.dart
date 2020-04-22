import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/datamodels/exam_enter_info.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:flutter_poznavacka/widgets/representative_details/representative_details.dart';

import '../../locator.dart';

class ExamView extends StatefulWidget {
  final String pin;

  ExamView({Key key, this.pin}) : super(key: key);
  @override
  _ExamViewState createState() => _ExamViewState();
}

class _ExamViewState extends State<ExamView> {
  PageController _controller = PageController();
  var _kDuration = new Duration(milliseconds: 300);
  var _kCurve = Curves.linear;
  var currentPageValue = 0.0;

  List listOfArrs = new List();
  List images = new List();

  @override
  void initState() {
    final ExamEnterInfo args = ModalRoute.of(context).settings.arguments;

    List infoArr = new List();
    infoArr.add("Slon");
    infoArr.add("chobotnatci");
    infoArr.add(args.pin);

    List infoArr1 = new List();
    infoArr1.add("Slon1");
    infoArr1.add("chobotnatci1");

    List elseInfoArr = new List();
    elseInfoArr.add("Else!");
    elseInfoArr.add("Else!!");
    elseInfoArr.add("Else!!!");
    elseInfoArr.add("Else!!!!");
    elseInfoArr.add("Else!!!!!");
    elseInfoArr.add("Else!!!!!");
    elseInfoArr.add("Else!!!!!");
    elseInfoArr.add("Else!!!!!");

    listOfArrs.add(infoArr);
    listOfArrs.add(infoArr1);
    listOfArrs.add(elseInfoArr);

    images.add(
        "https://www.peva.cz/deploy/img/products/28092/vrtak_test_1_28092.png");
    images.add(
        "https://www.tutorialspoint.com/dart_programming/images/if_else_statement.jpg");
    images.add("https://m.media-amazon.com/images/I/81l00MgXNRL._SS500_.jpg");

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        currentPageValue = _controller.page;
      });
    });

    var letterSize;
    if (MediaQuery.of(context).size.width > 600) {
      letterSize = 20;
    } else {
      letterSize = 15;
    }

    return Column(
      children: [
        Expanded(
          flex: 9,
          child: PageView.builder(
            controller: _controller,
            itemBuilder: (context, index) {
              if (index == currentPageValue.floor()) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - index),
                  child: RepresentativeDetails(
                    details: RepresentativeDetailsModel(
                      imageUrl: images[index],
                      infoArr: listOfArrs[index],
                    ),
                  ),
                );
              } else if (index == currentPageValue.floor() + 1) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - index),
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
            itemCount: 3,
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            //color: Colors.lightBlueAccent,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20 + 20,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: FlatButton(
                    color: colorAccentSecondary,
                    child: Text('Previous',
                        style: TextStyle(fontSize: letterSize)),
                    onPressed: () {
                      _controller.previousPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                  ),
                ),
                progressFinish(currentPageValue.round(), letterSize),
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.20 + 20,
                  height: MediaQuery.of(context).size.height * 0.07,
                  child: FlatButton(
                    padding: EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width * 0.07,
                        vertical: MediaQuery.of(context).size.height * 0.02),
                    color: colorAccentSecondary,
                    child: Text(
                      'Next',
                      style: TextStyle(fontSize: letterSize),
                    ),
                    onPressed: () {
                      _controller.nextPage(
                          duration: _kDuration, curve: _kCurve);
                    },
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget progressFinish(var currentPage, var letterSize) {
    if (currentPage == listOfArrs.length - 1) {
      return SizedBox(
        width: MediaQuery.of(context).size.width * 0.20 + 10,
        height: MediaQuery.of(context).size.height * 0.07,
        child: FlatButton(
          color: colorSave,
          child: Text('Finish', style: TextStyle(fontSize: letterSize)),
          onPressed: () {
            dismissDialog();
            /*showDialog(
              context: context,
              builder: (context) => finishAlert(),
              barrierDismissible: true,
            );*/
          },
        ),
      );
    } else {
      return Text(
        (currentPageValue.round() + 1).toString() +
            " \\ " +
            listOfArrs.length.toString(),
        style: TextStyle(color: Colors.white, fontSize: letterSize),
      );
    }
  }

  finishAlert() {
    return AlertDialog(
      title: Text('Finish?'),
      content: Text('Are you sure you want to finish the exam?'),
      actions: [
        FlatButton(
            onPressed: dismissDialog(),
            //onPressed: null,
            child: Text("No")),
        FlatButton(
          //onPressed: finish(),
          onPressed: null,
          child: Text("Yes"),
        )
      ],
      elevation: 24,
    );
  }

  dismissDialog() {
    myCallback(() {
      Navigator.pop(context, true);
    });
  }

  finish() {
    locator<NavigationService>().navigateTo(HomeRoute);
  }

  void myCallback(Function callback) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      callback();
    });
  }
}
