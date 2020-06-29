import 'package:flutter/material.dart';

import '../Constants.dart';

class Button extends StatelessWidget {
  final String text;
  final Function onPress;

  Button({this.text, this.onPress});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
      width: MediaQuery.of(context).size.width,
      child: MaterialButton(
        padding: EdgeInsets.all(6.0),
        elevation: 8.0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        color: Constants.KPrimaryColor,
        onPressed: onPress,
        child: Text(
          text,
          style: TextStyle(
              color: Constants.KaAccentColor,
              fontSize: 20,
              fontWeight: FontWeight.w700),
        ),
      ),
    );
  }
}
