import 'package:flutter/material.dart';
import 'package:servicerequest/localization/AppLocalization.dart';

import '../../Constants.dart';
import '../../sizeConfig.dart';

class LoginButton extends StatelessWidget {
  final Function onTap;
  final Color backgroundColor;
  final String imagePath;
  final bool isphone;
  final String textKey;
  LoginButton(
      {this.onTap,
      this.backgroundColor,
      this.isphone,
      this.imagePath,
      this.textKey});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(6),
          color: backgroundColor,
        ),
        child: Row(children: [
          Container(
            margin: EdgeInsets.symmetric(
                horizontal: SizeConfig.safeBlockHorizontal * 3,
                vertical: SizeConfig.safeBlockVertical),
            child: Image(
              color: isphone ? Constants.KWhiteColor : null,
              width: SizeConfig.safeBlockHorizontal * 7,
              height: SizeConfig.safeBlockVertical * 4,
              image: AssetImage(imagePath),
            ),
          ),
          Container(
            height: SizeConfig.safeBlockVertical * 5 +
                SizeConfig.safeBlockHorizontal * 2,
            width: 2,
            color: Constants.KWhiteColor,
          ),
          SizedBox(
            width: SizeConfig.safeBlockHorizontal * 4,
          ),
          Expanded(
            child: Text(
              AppLocalizations.of(context).translate(textKey),
              textAlign: TextAlign.start,
              style: TextStyle(
                  fontSize: 17,
                  color: Constants.KWhiteColor,
                  fontFamily: "Cairo-Regular.ttf"),
            ),
          )
        ]),
      ),
    );
  }
}
