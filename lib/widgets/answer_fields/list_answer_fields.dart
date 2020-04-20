import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import 'answer_field.dart';

class ListAnswerFields extends StatelessWidget {
  final List infoArr;
  const ListAnswerFields(
    this.infoArr, {
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
    infoArr.forEach((element) {
      arr.add(AnswerField(element));
    });
    return arr;
  }
}
