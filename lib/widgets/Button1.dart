import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/widgets/CustomFlatButton.dart';

class Button1 extends StatelessWidget {
  final Function onPress;
  final String text;
  Button1({this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(0),
      margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
      decoration: BoxDecoration(
          color: Constants.KPrimaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(8),
              bottomLeft: Radius.circular(8),
              topRight: Radius.circular(4),
              bottomRight: Radius.circular(4))),
      child: Row(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10),
            width: 40,
            height: 32,
            child: Image(
              image: AssetImage("images/wokshop.png"),
            ),
          ),
          Container(
            height: 48,
            width: 10,
            color: Colors.white,
          ),
          Expanded(
            child: CustomFlatButton(
              onPress: onPress,
              iconVisibility: false,
              text: text,
              iconPath: "images/car.png",
            ),
          )
        ],
      ),
    );
  }
}
