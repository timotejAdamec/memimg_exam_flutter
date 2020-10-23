import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/classification_details_model.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/widgets/answer_fields/list_answer_fields.dart';

class RepresentativeDetailsDesktop extends StatelessWidget {
  final RepresentativeDetailsModel model;
  final ClassificationDetailsModel classification;
  final int representativeIndex;
  const RepresentativeDetailsDesktop(
      {Key key, this.model, this.classification, this.representativeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Expanded(
          child: Center(
            child: Image.network(
              model.imageURL,
              fit: BoxFit.contain,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: ListAnswerFields(representativeIndex, model.infoArr,
                classification.classification),
          ),
        )
      ],
    );
  }
}
