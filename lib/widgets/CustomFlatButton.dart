import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class CustomFlatButton extends StatelessWidget {
  final Function onPress;
  final String text;
  final bool iconVisibility;
  final String iconPath;
  final double paddingValue;
  final bool dividerVisibility;

  CustomFlatButton(
      {this.onPress,
      this.paddingValue,
      this.text,
      this.dividerVisibility,
      this.iconVisibility,
      this.iconPath});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      padding: EdgeInsets.all(6.0),
      elevation: 4.0,
      color: Constants.KPrimaryColor,
      onPressed: onPress,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: paddingValue),
        child: Wrap(
          children: [
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
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
                            //textDirection: TextDirection.rtl,
                            textAlign: TextAlign.right,
                            style: TextStyle(
                                color: Constants.KaAccentColor,
                                fontSize: 20,
                                fontWeight: FontWeight.w700),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Image(
                              width: 40,
                              height: 32,
                              image: AssetImage(iconPath),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Visibility(
                    visible: dividerVisibility,
                    child: SizedBox(
                      child: Divider(
                        color: Colors.white,
                        height: 2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
