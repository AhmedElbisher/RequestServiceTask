import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Constants.dart';

class PickerConstructor extends StatelessWidget {
  final int builderCount;
  final Function itemBuiler;
  final Function onSelectedChanged;
  final int initIndex;
  final FixedExtentScrollController fixedExtentScrollController =
      FixedExtentScrollController(initialItem: 1);

  PickerConstructor(
      {this.initIndex,
      this.onSelectedChanged,
      this.builderCount,
      this.itemBuiler});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 30, top: 8),
      child: CupertinoTheme(
        data: CupertinoThemeData(
            textTheme: CupertinoTextThemeData(
                pickerTextStyle:
                    TextStyle(fontSize: 15, color: Constants.KPrimaryColor))),
        child: CupertinoPicker.builder(
          diameterRatio: 5,
          scrollController: fixedExtentScrollController,
          offAxisFraction: -2,
          squeeze: .90,
          // useMagnifier: true,
          // magnification: 1.75,
          onSelectedItemChanged: onSelectedChanged,
          itemExtent: 40,
          childCount: builderCount,
          itemBuilder: itemBuiler,
        ),
      ),
    );
  }
}
