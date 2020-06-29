import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final List<Widget> childern;
  final Color color;
  CustomContainer({this.childern, this.color});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      padding: EdgeInsets.only(left: 20, right: 20, bottom: 10),
      color: Colors.white,
      child: Wrap(
        children: [
          Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: childern),
        ],
      ),
    );
  }
}
