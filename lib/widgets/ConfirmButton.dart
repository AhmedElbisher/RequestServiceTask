import 'package:flutter/material.dart';

import '../Constants.dart';

class ConfirmButton extends StatelessWidget {
  final Function onPress;
  final String text;
  ConfirmButton({this.text, this.onPress});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Constants.KPrimaryColor),
      child: MaterialButton(
        elevation: 4,
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
