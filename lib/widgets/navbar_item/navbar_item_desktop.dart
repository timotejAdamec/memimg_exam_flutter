import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/navbar_item_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NavBarItemTabletDesktop extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Row(
      children: <Widget>[
        Icon(Icons.help, color: Colors.white),
        SizedBox(
          width: 15,
        ),
        Text(
          model.title,
          style: TextStyle(fontSize: 18, color: Colors.white),
        )
      ],
    );
  }
}
