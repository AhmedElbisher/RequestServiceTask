import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/localization/AppLocalization.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/sizeConfig.dart';
import 'package:servicerequest/viewmodels/langauge_model.dart';
import 'package:servicerequest/widgets/loginWidgets/AgreeWithTerms.dart';
import 'package:servicerequest/widgets/loginWidgets/LoginButton.dart';
import 'package:servicerequest/widgets/loginWidgets/OrRowDivider.dart';

class MainLoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    locator<SizeConfig>().init(context);
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.safeBlockHorizontal * 5,
              vertical: SizeConfig.safeBlockVertical * 3),
          child: Column(
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Flexible(
                      child: Container(
                        height: SizeConfig.safeBlockVertical * 43,
                        child: Center(
                          child: Image(
                            height: SizeConfig.safeBlockVertical * 35,
                            width: SizeConfig.safeBlockHorizontal * 40,
                            image: AssetImage("images/Login_logo.png"),
                          ),
                        ),
                      ),
                    ),
                    LoginButton(
                      onTap: () {},
                      backgroundColor: Constants.KFacebookBlueColor,
                      imagePath: "images/facebook_logo.png",
                      textKey: "faceLogin",
                      isphone: false,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    LoginButton(
                      onTap: () {},
                      backgroundColor: Constants.KRedColor,
                      imagePath: "images/googlePlus.png",
                      textKey: "googleLogin",
                      isphone: false,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    OrRowDivider(),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical * 3,
                    ),
                    LoginButton(
                      onTap: () {
                        //todo delete that
                        Navigator.pushNamed(
                            context, Constants.KPhoneLoginScreen);
                      },
                      backgroundColor: Constants.KDarkBlueColor,
                      imagePath: "images/login_Phone-1.png",
                      textKey: "phoneLogin",
                      isphone: true,
                    ),
                    SizedBox(
                      height: SizeConfig.safeBlockVertical,
                    ),
                    Text(
                      AppLocalizations.of(context).translate("Not Now"),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          height: 1.5,
                          fontSize: 14,
                          color: Constants.KDarkGrayColor,
                          fontFamily: "Cairo-Regular.ttf"),
                    )
                  ],
                ),
              ),
              AgreeWithTermsRow(
                onCheckBoxChange: (value) {},
                onTermsTap: () {
                  //todo delete that
                  Provider.of<AppLanguage>(context, listen: false)
                      .changeLanguage(Locale("ar"));
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
