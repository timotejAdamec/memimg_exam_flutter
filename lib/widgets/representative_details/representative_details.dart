import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/classification_details_model.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'representative_details_desktop.dart';
import 'representative_details_mobile.dart';

class RepresentativeDetails extends StatelessWidget {
  final RepresentativeDetailsModel details;
  final ClassificationDetailsModel classification;
  final int representativeIndex;
  const RepresentativeDetails(
      {Key key, this.details, this.classification, this.representativeIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: RepresentativeDetailsDesktop(
          representativeIndex: representativeIndex,
          model: details,
          classification: classification),
      mobile: RepresentativeDetailsMobile(
          representativeIndex: representativeIndex,
          model: details,
          classification: classification),
    );
  }
}
