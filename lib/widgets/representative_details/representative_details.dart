import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/classification_details_model.dart';
import 'package:flutter_poznavacka/datamodels/representative_details_model.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'representative_details_desktop.dart';
import 'representative_details_mobile.dart';

class RepresentativeDetails extends StatelessWidget {
  final RepresentativeDetailsModel details;
  final ClassificationDetailsModel classification;
  const RepresentativeDetails({Key key, this.details, this.classification})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      desktop: RepresentativeDetailsDesktop(
          model: details, classification: classification),
      mobile: RepresentativeDetailsMobile(
          model: details, classification: classification),
    );
  }
}
