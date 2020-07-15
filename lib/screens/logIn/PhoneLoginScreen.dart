import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/localization/AppLocalization.dart';
import 'package:servicerequest/widgets/loginWidgets/AgreeWithTerms.dart';
import 'package:servicerequest/widgets/loginWidgets/ConfirmButton.dart';
import 'package:servicerequest/widgets/loginWidgets/CountryDropDown.dart';
import 'package:servicerequest/widgets/loginWidgets/CustomScaffoldStackScroll.dart';
import 'package:servicerequest/widgets/loginWidgets/phoneTextField.dart';

import '../../sizeConfig.dart';

class PhoneLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldStackScroll(
      back: () {
        Navigator.pop(context);
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  AppLocalizations.of(context).translate("phoneLogin2"),
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 18,
                      fontFamily: Constants.CAIRO_FONT_FAMILY,
                      fontWeight: FontWeight.w700,
                      color: Constants.KGoldGrayColor),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 4,
                ),
                Text(
                  AppLocalizations.of(context).translate("country"),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: Constants.CAIRO_FONT_FAMILY),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical,
                ),
                CountryDropDownButton(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                Text(
                  AppLocalizations.of(context).translate("phoneNumber"),
                  textAlign: TextAlign.start,
                  style: TextStyle(
                      fontSize: 13,
                      color: Colors.black,
                      fontFamily: Constants.CAIRO_FONT_FAMILY),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical,
                ),
                Row(
                  children: [
                    PhoneTextField(
                      flex: 4,
                      textaAliment: TextAlign.start,
                      hint: "545545454",
                      icon: Icon(
                        Icons.phone,
                        size: SizeConfig.safeBlockVertical * 4,
                      ),
                    ),
                    SizedBox(
                      width: SizeConfig.safeBlockHorizontal * 3,
                    ),
                    PhoneTextField(
                      flex: 1,
                      hint: "966+",
                      textaAliment: TextAlign.center,
                      icon: null,
                    ),
                  ],
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                AgreeWithTermsRow(),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 3,
                ),
                ConfirmButton(
                  textKey: "confirm",
                  onPress: () {
                    Navigator.pushNamed(
                        context, Constants.KVerificationCodeScreen);
                  },
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
