import 'dart:ui';

import 'package:flutter/material.dart';

class Constants {
  static const String KMapRoute = '/';
  static const String KMap2Route = '/map2';

  static const Color KaAccentColor = Color(0xffd0b475);
  static const Color KHelperColor = Color(0xff9e9999);
  static const Color KDecorationColor = Color(0xffdf0808);
  static const Color KLineThouthTextColor = Color(0xffc8c8c8);
  static const TextStyle KProviderTextStyle = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: Constants.KPrimaryColor,
  );
  static const TextStyle KSelectedItem = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: Constants.KPrimaryColor,
  );
  static const TextStyle KUnSelectedItem = TextStyle(
    fontSize: 19,
    fontWeight: FontWeight.w700,
    color: Color(0xff9e9999),
  );

  static const TextStyle KSelectedHr = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Constants.KPrimaryColor,
  );
  static const TextStyle KConfirmFirestTextStyle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: Constants.KPrimaryColor,
  );

  static const TextStyle KConfirmSecondTextStyle = TextStyle(
    fontSize: 15,
    color: Color(0xff6b6b6b),
  );

  static const TextStyle KConfirmTimeTextStyle = TextStyle(
    fontSize: 40,
    fontWeight: FontWeight.w900,
    color: Color(0xffc3922e),
  );
  static const TextStyle KUnSelectedHr = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w700,
    color: Color(0xff9e9999),
  );

  static const Color KPrimaryColor = Color(0xff002d57);
  static const double KSearchIconSize = 30;

  static const List<String> AMPM = ["صباح", "مساء"];
  static final List<String> hours = List<String>.generate(12, (index) {
    if (index + 1 < 10) {
      return "0${index + 1}:00-0${index + 1}:30";
    } else {
      return "${index + 1}:00-${index + 1}:30";
    }
  });
}
