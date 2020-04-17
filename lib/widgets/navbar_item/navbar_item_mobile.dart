import 'package:flutter/material.dart';
import 'package:flutter_poznavacka/datamodels/navbar_item_model.dart';
import 'package:provider_architecture/provider_architecture.dart';

class NavBarItemMobile extends ProviderWidget<NavBarItemModel> {
  @override
  Widget build(BuildContext context, NavBarItemModel model) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Row(
        children: <Widget>[
          Icon(Icons.help, color: Colors.white),
          SizedBox(
            width: 30,
          ),
          Text(
            model.title,
            style: TextStyle(fontSize: 18, color: Colors.white),
          )
        ],
      ),
    );
  }
}
