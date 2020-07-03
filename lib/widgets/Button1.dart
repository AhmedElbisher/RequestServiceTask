import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/CustomFlatButton.dart';

class Button1 extends StatelessWidget {
  final Function onPress;
  final String text;
  Button1({this.onPress, this.text});
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(
      builder: (context, model, childe) => Container(
        height: 43.0,
        margin: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 30),
        decoration: BoxDecoration(
            color: Colors.transparent.withOpacity(0),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                bottomLeft: Radius.circular(8),
                topRight: Radius.circular(6),
                bottomRight: Radius.circular(6))),
        child: Row(
          children: [
            GestureDetector(
              onTap: () {
                model.setLocalNav(LocalNav.SELECT_SERVICE);
              },
              child: Material(
                elevation: 4,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    bottomLeft: Radius.circular(8)),
                child: Container(
                  //margin: EdgeInsets.symmetric(vertical: 10),
                  //padding: EdgeInsets.symmetric(horizontal: 8),
                  // width: 47,
                  decoration: BoxDecoration(
                      color: Constants.KPrimaryColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          bottomLeft: Radius.circular(8))),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Image(
                      height: 36,
                      image: AssetImage("images/wokshop.png"),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 48,
              width: 10,
              color: Colors.transparent.withOpacity(0),
            ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Constants.KPrimaryColor,
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(6),
                        topRight: Radius.circular(6))),
                child: Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: CustomFlatButton(
                    paddingValue: 0.0,
                    dividerVisibility: false,
                    onPress: onPress,
                    iconVisibility: false,
                    text: text,
                    iconPath: "images/car.png",
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
