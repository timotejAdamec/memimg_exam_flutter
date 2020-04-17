import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:flutter_poznavacka/widgets/answer_fields/list_answer_fields.dart';

class RepresentativeDetailsMobile extends StatelessWidget {
  final RepresentativeDetailsModel model;
  const RepresentativeDetailsMobile({
    Key key,
    this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: SizedBox(
              height: 100,
              child: Center(
                child: Image.network(
                  model.imageUrl,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          Expanded(
            child: Center(
              child: ListAnswerFields(model.infoArr),
            ),
          ),

          /*Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 15.0,
                vertical: 20,
              ),
              child: ListAnswerFields(model.infoArr),
            ),*/
        ],
      ),
    );
  }
}
