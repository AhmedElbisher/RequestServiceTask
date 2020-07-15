import 'package:flutter/material.dart';

import '../../Constants.dart';
import '../../sizeConfig.dart';
import '../BackArrow.dart';

class CustomScaffoldStackScroll extends StatelessWidget {
  final Widget child;
  final Function back;
  CustomScaffoldStackScroll({this.child, this.back});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(children: [
          SingleChildScrollView(
            child: Container(
                height: SizeConfig.screenHeight,
                margin: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 5,
                    vertical: SizeConfig.safeBlockVertical * 3),
                child: child),
          ),
          BackArrow(
            back: back,
            color: Constants.KGrayColor,
          ),
        ]),
      ),
    );
    ;
  }
}
