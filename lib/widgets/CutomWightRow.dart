import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';

class CutomWightRow extends StatelessWidget {
  final String text;
  final bool iconVisibility;
  final Function onTap;
  CutomWightRow({this.onTap, this.text, this.iconVisibility});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        children: [
          Visibility(
            visible: iconVisibility,
            child: Icon(
              Icons.check,
              size: 20,
              color: Constants.KHelperColor,
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                text,
                textDirection: TextDirection.rtl,
                textAlign: TextAlign.start,
                style: TextStyle(
                    color: Color(0xff9e9999),
                    fontWeight: FontWeight.w700,
                    fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
