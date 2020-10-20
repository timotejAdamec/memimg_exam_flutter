import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'classification/answer_field.dart';
import 'name/name_answer_field.dart';

class ListAnswerFields extends StatelessWidget {
  final List infoArr;
  final List classification;
  const ListAnswerFields(
    this.infoArr,
    this.classification, {
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _scrollController = new ScrollController();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
        _scrollController.animateTo(
          0,
          curve: Curves.easeOut,
          duration: const Duration(milliseconds: 200),
        );
      }
    });
    return Scrollbar(
      controller: _scrollController,
      isAlwaysShown: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: answerFields()),
      ),
    );
  }

  answerFields() {
    List<Widget> arr = new List();
    arr.add(new NameAnswerField(infoArr.first));
    if (classification != null && classification.isNotEmpty) {
      classification.forEach((element) {
        arr.add(new ClassificationAnswerField(element));
      });
    }
    return arr;
  }
}
