import 'package:flutter/material.dart';

import 'Button1.dart';
import 'WhiteBottomContainer.dart';

class StartRequest extends StatelessWidget {
  final Function onPress;
  final String name;
  final bool visibility;
  StartRequest({this.onPress, this.name, this.visibility});
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Visibility(
          visible: visibility,
          child: WhiteBottomContainer(
            cancelIconVisability: false,
            onCancel: () {},
            currentLocationName: name,
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Button1(
            onPress: onPress,
            text: "الفحص الدورى للسيارة",
          ),
        ),
      ],
    );
  }
}
