import 'package:flutter/material.dart';

import '../Constants.dart';

class WhiteBottomContainer extends StatelessWidget {
  final bool cancelIconVisability;
  final Function onCancel;
  final String currentLocationName;

  WhiteBottomContainer(
      {this.cancelIconVisability, this.onCancel, this.currentLocationName});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8))),
        margin: EdgeInsets.symmetric(horizontal: 10),
        padding: EdgeInsets.only(bottom: 100, top: 16, left: 10, right: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Visibility(
              visible: cancelIconVisability,
              child: GestureDetector(
                  onTap: onCancel,
                  child: CircleAvatar(
                    radius: 12,
                    backgroundColor: Constants.KaAccentColor,
                    child: Icon(
                      Icons.clear,
                      size: 20.0,
                      color: Colors.white,
                    ),
                  )),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      currentLocationName,
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      style: TextStyle(
                          fontSize: 20, color: Constants.KPrimaryColor),
                    ),
                  ),
                  Icon(
                    Icons.location_on,
                    size: 20,
                    color: Constants.KPrimaryColor,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
