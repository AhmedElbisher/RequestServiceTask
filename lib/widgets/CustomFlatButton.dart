import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomFlatButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool iconVisibility;
  final String iconPath;

  CustomFlatButton(
      {this.onPress, this.text, this.iconVisibility, this.iconPath});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(6.0),
      elevation: 4.0,
      color: Constants.KPrimaryColor,
      onPressed: onPress,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: iconVisibility,
            child: Icon(
              Icons.check,
              size: 20,
              color: Colors.white,
            ),
          ),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  text,
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                      color: Constants.KaAccentColor,
                      fontSize: 20,
                      fontWeight: FontWeight.w700),
                ),
                Container(
                  margin: EdgeInsets.only(left: iconVisibility ? 20 : 10),
                  width: 40,
                  height: 32,
                  child: Image(
                    image: AssetImage(iconPath),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
