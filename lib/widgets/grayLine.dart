import 'package:flutter/material.dart';

class GrayLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 5,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6.0), color: Color(0xff9e9999)),
      child: Divider(
        thickness: 2,
        color: Color(0xff9e9999),
      ),
    );
  }
}
