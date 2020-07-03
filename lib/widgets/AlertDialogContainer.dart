import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertDialogContainer extends StatelessWidget {
  final List<Widget> childern;
  AlertDialogContainer({this.childern});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return AlertDialog(
        contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        content: Container(
          height: size.height / 2,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: childern),
        ));
  }
}
