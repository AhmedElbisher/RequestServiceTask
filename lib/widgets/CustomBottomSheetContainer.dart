import 'package:flutter/material.dart';

class CustomBottomSheetContainer extends StatelessWidget {
  final Widget child;
  CustomBottomSheetContainer({this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: MediaQuery.of(context).size.height * 2 / 5,
        padding: EdgeInsets.only(
          top: 8,
          bottom: 30,
        ),
        child: child);
  }
}
