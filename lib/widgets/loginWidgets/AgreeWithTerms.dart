import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/localization/AppLocalization.dart';

import '../../Constants.dart';

class AgreeWithTermsRow extends StatelessWidget {
  final Function onCheckBoxChange;
  final Function onTermsTap;
  AgreeWithTermsRow({this.onCheckBoxChange, this.onTermsTap});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
            margin: EdgeInsets.only(left: 4, right: 4),
            decoration: const BoxDecoration(
              color: Constants.KLightGrayColor,
              border: Border(
                top: BorderSide(width: 2.0, color: Constants.KGrayColor),
                left: BorderSide(width: 2.0, color: Constants.KGrayColor),
                right: BorderSide(width: 2.0, color: Constants.KGrayColor),
                bottom: BorderSide(width: 2.0, color: Constants.KGrayColor),
              ),
            ),
            child: Transform.scale(
              scale: .70,
              child: Checkbox(
                value: true,
                onChanged: onCheckBoxChange,
                activeColor: Constants.KLightGrayColor,
                checkColor: Colors.black54,
              ),
            ),
            width: 15,
            height: 15),
        Expanded(
          child: RichText(
            key: GlobalKey(),
            text: TextSpan(children: [
              TextSpan(
                text: AppLocalizations.of(context).translate("agree with"),
                style: TextStyle(
                    fontSize: 11,
                    color: Colors.grey.shade600,
                    fontWeight: FontWeight.w500,
                    fontFamily: Constants.CAIRO_FONT_FAMILY),
              ),
              TextSpan(
                text: AppLocalizations.of(context).translate("Terms"),
                style: TextStyle(
                    fontSize: 11,
                    decoration: TextDecoration.underline,
                    color: Constants.KDarkGrayColor,
                    fontWeight: FontWeight.w700,
                    fontFamily: Constants.CAIRO_FONT_FAMILY),
                recognizer: TapGestureRecognizer()..onTap = onTermsTap,
              )
            ]),
          ),
        )
      ],
    );
  }
}
