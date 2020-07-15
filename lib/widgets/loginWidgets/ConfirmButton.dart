import 'package:flutter/material.dart';
import 'package:servicerequest/localization/AppLocalization.dart';

import '../../Constants.dart';

class ConfirmButton extends StatelessWidget {
  final String textKey;
  final Function onPress;
  ConfirmButton({this.textKey, this.onPress});
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(6.0),
      elevation: 4.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      color: Constants.KDarkBlueColor,
      onPressed: onPress,
      child: Text(
        AppLocalizations.of(context).translate(textKey),
        style: TextStyle(
            color: Constants.KaAccentColor,
            fontSize: 17,
            fontFamily: Constants.CAIRO_FONT_FAMILY,
            fontWeight: FontWeight.w700),
      ),
    );
  }
}
