import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/localization/AppLocalization.dart';
import 'package:servicerequest/sizeConfig.dart';
import 'package:servicerequest/widgets/loginWidgets/ConfirmButton.dart';
import 'package:servicerequest/widgets/loginWidgets/CustomScaffoldStackScroll.dart';

class VerificationCodeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScaffoldStackScroll(
      back: () {
        Navigator.pop(context);
      },
      // child of scaffold .. safeArea.. singleChildScrollView.. container with margin
      child: LayoutBuilder(builder: (context, constains) {
        return Container(
          width: constains.maxWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: SizeConfig.safeBlockVertical * 20,
              ),
              Text(
                AppLocalizations.of(context).translate("verificationCode"),
                style: TextStyle(
                    fontFamily: Constants.CAIRO_FONT_FAMILY,
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Constants.KDarkGrayColor),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical,
              ),
              PinTextField(),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 1,
              ),
              Text(
                AppLocalizations.of(context).translate("resend"),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: Constants.CAIRO_FONT_FAMILY,
                  fontSize: 16,
                  color: Constants.KGoldGrayColor,
                  fontWeight: FontWeight.w600,
                  decoration: TextDecoration.underline,
                ),
              ),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              Container(
                width: constains.maxWidth,
                padding: EdgeInsets.symmetric(
                    horizontal: SizeConfig.safeBlockHorizontal * 2),
                child: ConfirmButton(
                  textKey: "confirm",
                  onPress: () {},
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}

class PinTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: ConstrainedBox(
        constraints:
            BoxConstraints(maxWidth: SizeConfig.safeBlockHorizontal * 70),
        child: PinCodeTextField(
          textInputType: TextInputType.number,
          length: 6,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          obsecureText: false,
          animationType: AnimationType.fade,
          pinTheme: PinTheme(
              shape: PinCodeFieldShape.underline,
              fieldHeight: 40,
              inactiveColor: Constants.KGrayColor,
              fieldWidth: 25,
              activeFillColor: Colors.transparent),
          animationDuration: Duration(milliseconds: 300),
          backgroundColor: Constants.KWhiteColor,
          enableActiveFill: false,
//                  controller: textEditingController,
          onCompleted: (v) {
            print("Completed");
          },
          onChanged: (value) {
            print(value);
          },
        ),
      ),
    );
  }
}
