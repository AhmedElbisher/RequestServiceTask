import 'package:flutter/material.dart';
import 'package:servicerequest/localization/AppLocalization.dart';

import '../../Constants.dart';
import '../../sizeConfig.dart';

class CountryDropDownButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.symmetric(horizontal: SizeConfig.safeBlockHorizontal * 3),
      decoration: BoxDecoration(
        color: Constants.KWhiteColor,
        borderRadius: BorderRadius.circular(4),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
          icon: Icon(
            Icons.keyboard_arrow_down,
            color: Constants.KGrayColor,
          ),
          hint: Text(
            AppLocalizations.of(context).translate("Saudi Arabia"),
            style: TextStyle(
              fontFamily: Constants.CAIRO_FONT_FAMILY,
              fontSize: 15,
              color: Constants.KGrayColor,
            ),
          ),
          iconSize: SizeConfig.safeBlockVertical * 5,
          items: [
            DropdownMenuItem(
                value: 1,
                child: Text(
                  AppLocalizations.of(context).translate("Saudi Arabia"),
                  style: TextStyle(
                    fontFamily: Constants.CAIRO_FONT_FAMILY,
                    fontSize: 15,
                    color: Colors.black,
                  ),
                ))
          ],
          onChanged: (int value) {
            print(value);
          },
        ),
      ),
    );
  }
}
