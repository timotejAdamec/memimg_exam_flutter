import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/constants/app_colors.dart';
import 'package:flutter_poznavacka/datamodels/classification_details_model.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/datamodels/result_object_db.dart';
import 'package:flutter_poznavacka/datamodels/result_object_db.dart';
import 'package:flutter_poznavacka/routing/route_names.dart';
import 'package:flutter_poznavacka/services/navigation_service.dart';
import 'package:flutter_poznavacka/widgets/dialog/blurry_dialog.dart';
import 'package:flutter_poznavacka/widgets/representative_details/representative_details.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';
import 'package:loading/loading.dart';
import 'package:responsive_builder/responsive_builder.dart';
import '../../services/locator.dart';
import 'package:http/http.dart' as http;

class ExamView extends StatefulWidget {
  final String pin;
  static List<List<String>> answers;

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

  //static List<String> answers = new List();

  final myController = TextEditingController();
  bool _nameEntered = false;
  bool _loaded = false;
  bool _error = false;
  String _ipAddress = "IpAdress = ";
  double _letterSize;
  String _userName;
  String _examDBID;
  String _examCreatorID;

  set letterSize(int letterSize) {
    _letterSize = letterSize as double;
  }

  void getIpAdress() async {
    final response = await http.get('https://api64.ipify.org');
    if (response.statusCode == 200) {
      setState(() {
        _ipAddress += response.body +
            "height" +
            MediaQuery.of(context).size.height.toString();
      });
      print("IPADRESS = " + _ipAddress);
    }
  }

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
          .collection("ActiveTests")
          .where("testCode", isEqualTo: widget.pin)
          .limit(1)
          .get()
          .then((querySnapshot) {
        QueryDocumentSnapshot doc = querySnapshot.docs.first;
        print("content = " + doc.get("content"));
        _examDBID = doc.get("testDBID");
        _examCreatorID = doc.get("userID");
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
    //getIpAdress();
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
      locator<NavigationService>().goBack();
      print("ExamView somethingWentWrong()");
      //return somethingWentWrong();
    }

    if (!_loaded) {
      return loading();
    }

    if (_nameEntered) {
      return examViewWidget();
    } else {
      return nameEnterWidget();
    }
  }

  Widget nameEnterWidget() {
    var boxWidth;
    if (MediaQuery.of(context).size.width > 600) {
      _letterSize = 20;
      boxWidth = 400;
    } else {
      _letterSize = 15;
      boxWidth = MediaQuery.of(context).size.width - 50;
    }

    return ResponsiveBuilder(builder: (context, sizingInformation) {
      return Center(
        child: SizedBox(
          //padding: const EdgeInsets.symmetric(horizontal: 60, vertical: 30),
          height: 100,
          width: boxWidth,
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
                          hintText: "Enter your name",
                          hintStyle: TextStyle(
                              color: Colors.grey, fontSize: _letterSize),
                          border: InputBorder.none),
                      style: TextStyle(
                          fontSize: _letterSize,
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
                    _userName = myController.text;
                    setState(() {
                      _nameEntered = true;
                    });
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "Done",
                        style: TextStyle(
                          fontSize: _letterSize,
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
        ),
      );
    });
  }

  Widget somethingWentWrong() {
    return Center(
      child: Text(
        "Error",
        style: TextStyle(color: Colors.white, fontSize: _letterSize),
      ),
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
                        representativeIndex: index,
                        details: representatives[index],
                        classification: classification));
              } else if (index == currentPageValue.floor() + 1) {
                return Transform(
                  transform: Matrix4.identity()
                    ..rotateX(currentPageValue - index),
                  child: RepresentativeDetails(
                      representativeIndex: index,
                      details: representatives[index],
                      classification: classification),
                );
              } else {
                return RepresentativeDetails(
                    representativeIndex: index,
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
            _showDialog(context);
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

  _showDialog(BuildContext context) {
    VoidCallback continueCallBack = () => {
          sendData(),
        };
    BlurryDialog alert = BlurryDialog(
        "Finish", "Are you sure you want finish the exam?", continueCallBack);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
      barrierDismissible: true,
    );
  }

  void sendData() async {
    await FirebaseFirestore.instance
        .collection("Users")
        .doc(_examCreatorID)
        .collection("Exams")
        .doc(_examDBID)
        .get()
        .then((documentSnapshot) {
      DocumentSnapshot doc = documentSnapshot;
      if (doc.exists) {
        bool finished = doc.get("finished");
        if (!finished) {
          int correctlyAnswered = 0;
          for (int i = 0; i < ExamView.answers.length; i++) {
            for (int k = 0; k < ExamView.answers[i].length; k++) {
              // ExamView answers are answeres as answered by the user
              if (ExamView.answers[i][k] != null) {
                if (ExamView.answers[i][k].toLowerCase().trim() ==
                    representatives[i].infoArr[k].toLowerCase().trim()) {
                  correctlyAnswered++;
                }
              }
            }
          }
          String result = (correctlyAnswered.toString() +
              '/' +
              (representatives.length *
                      (classification.classification.length + 1))
                  .toString());
          ResultObjectDB dbData = ResultObjectDB("web_user", result, _userName);

//TODO, udelat vyhodnoceni testu?

          FirebaseFirestore.instance
              .collection("Users")
              .doc(_examCreatorID)
              .collection("Exams")
              .doc(_examDBID)
              .collection("Results")
              .add(dbData.toMap());
          Navigator.of(context).pop();
        }
      }
    });
  }

  void loadRepresentatives(QueryDocumentSnapshot doc) {
    representatives = (json.decode(doc.get("content")) as List)
        .map((i) => RepresentativeDetailsModel.fromJson(i))
        .toList();
    ExamView.answers = new List(representatives.length);
    print("predeserialization");
    try {
      if (doc.get("classification") is String) {
        print("deserialization decode is String");
        classification = ClassificationDetailsModel.fromJson(
            jsonDecode(doc.get("classification")));
        for (int i = 0; i < ExamView.answers.length; i++) {
          ExamView.answers[i] =
              new List(classification.classification.length + 1);
        }
      } else {
        for (int i = 0; i < ExamView.answers.length; i++) {
          ExamView.answers[i] = new List(1);
        }
      }
      print("deserialization try end");
    } catch (e) {
      print("deserialization catch e = " + e);
    }
  }
}
