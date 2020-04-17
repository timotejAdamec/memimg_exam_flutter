import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/widgets/answer_fields/list_answer_fields.dart';

class RepresentativeDetailsDesktop extends StatelessWidget {
  final RepresentativeDetailsModel model;
  const RepresentativeDetailsDesktop({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: SizedBox(
            height: 300,
            child: Center(
              child: Image.network(
                model.imageUrl,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ),
        Expanded(
          child: SizedBox(
                      child: Center(
              child: ListAnswerFields(model.infoArr),
            ),
          ),
        )
      ],
    );
  }
}
