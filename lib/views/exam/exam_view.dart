import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/datamodels/classification_details_model.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:flutter_poznavacka/widgets/representative_details/representative_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
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

  ClassificationDetailsModel classification = new ClassificationDetailsModel();
  List<RepresentativeDetailsModel> representatives = new List();

  bool _loaded = false;
  bool _error = false;

  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      print(e);
      setState(() {
        _error = true;
      });
    }
  }

  void loadFSData() async {
    try {
      await FirebaseFirestore.instance
          .collection("ActiveTest")
          .where("testCode", isEqualTo: widget.pin)
          .limit(1)
          .get()
          .then((querySnapshot) {
        QueryDocumentSnapshot doc = querySnapshot.docs.first;
        print("content = " + doc.get("content"));
        loadRepresentatives(doc);
        setState(() {
          _loaded = true;
        });
      });
    } catch (e) {
      print(e);
      setState(() {
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    loadFSData();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    if (_error) {
      print("ExamView somethingWentWrong()");
      return somethingWentWrong();
    }

    if (!_loaded) {
      print("ExamView loading()");
      return loading();
    }

    print("ExamView examViewWidget()");
    return examViewWidget();
  }

  Widget somethingWentWrong() {
    return Center(
      child: Text("Error"),
    );
  }

  Widget loading() {
    return Center(
        child: Loading(
      indicator: BallPulseIndicator(),
      size: 100,
      color: Colors.blueAccent,
    ));
  }

  Widget examViewWidget() {
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
                        details: representatives[index],
                        classification: classification));
              } else if (index == currentPageValue.floor() + 1) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - index),
                  child: RepresentativeDetails(
                      details: representatives[index],
                      classification: classification),
                );
              } else {
                return RepresentativeDetails(
                    details: representatives[index],
                    classification: classification);
              }
            },
            itemCount: representatives.length,
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
    if (currentPage == representatives.length - 1) {
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
            representatives.length.toString(),
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

  void loadRepresentatives(QueryDocumentSnapshot doc) {
    representatives = (json.decode(doc.get("content")) as List)
        .map((i) => RepresentativeDetailsModel.fromJson(i))
        .toList();
    print("predeserialization");
    try {
      if (doc.get("classification") == String) {
        print("deserialization decode is String");
        classification = ClassificationDetailsModel.fromJson(
            jsonDecode(doc.get("classification")));
      }
      print("deserialization try end");
    } catch (e) {
      print("deserialization catch e = " + e);
    }
  }
}
