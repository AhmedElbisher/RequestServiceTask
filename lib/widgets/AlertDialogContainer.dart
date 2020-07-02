import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogContainer extends StatelessWidget {
  final List<Widget> childern;

  AlertDialogContainer({this.childern});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
        content: Container(
          //width: minSize - 60,
          height: size.height / 2,
          // margin: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center, children: childern),
        ));
  }
}
