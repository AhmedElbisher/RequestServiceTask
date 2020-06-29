import 'package:flutter/material.dart';

import '../Constants.dart';

class BackArrow extends StatelessWidget {
  final Function back;

  BackArrow({this.back});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.all(20),
        child: GestureDetector(
          onTap: back,
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
            size: Constants.KSearchIconSize,
          ),
        ),
      ),
    );
  }
}
