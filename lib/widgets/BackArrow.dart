import 'package:flutter/material.dart';
import 'package:servicerequest/sizeConfig.dart';

import '../Constants.dart';

class BackArrow extends StatelessWidget {
  final Function back;
  final Color color;
  BackArrow({this.back, this.color});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin:
            EdgeInsets.only(top: 20, left: SizeConfig.safeBlockHorizontal * 3),
        child: GestureDetector(
          onTap: back,
          child: Icon(
            Icons.arrow_back_ios,
            color: color ?? Colors.white,
            size: Constants.KSearchIconSize,
            textDirection: TextDirection.ltr,
          ),
        ),
      ),
    );
  }
}
