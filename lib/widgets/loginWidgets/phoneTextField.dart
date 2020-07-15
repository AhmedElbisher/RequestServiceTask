import 'package:flutter/material.dart';

import '../../Constants.dart';

class PhoneTextField extends StatelessWidget {
  final int flex;
  final Icon icon;
  final String hint;
  final TextAlign textaAliment;
  PhoneTextField({this.flex, this.icon, this.hint, this.textaAliment});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Constants.KWhiteColor,
        ),
        child: TextField(
          keyboardType: TextInputType.number,
          textAlign: textaAliment,
          decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: icon ?? null,
            hintText: hint,
            contentPadding: EdgeInsets.all(8),
            hintStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                fontFamily: Constants.CAIRO_FONT_FAMILY,
                color: Constants.KGrayColor),
          ),
        ),
      ),
    );
  }
}
