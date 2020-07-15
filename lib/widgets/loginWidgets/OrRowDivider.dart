import 'package:flutter/material.dart';
import 'package:servicerequest/localization/AppLocalization.dart';

import '../../Constants.dart';

class OrRowDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: SizedBox(
            child: Divider(
              height: 1,
              color: Constants.KGrayColor,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            AppLocalizations.of(context).translate("or"),
            style: TextStyle(
                fontSize: 17,
                color: Colors.grey.shade500,
                fontFamily: "Cairo-Regular.ttf"),
          ),
        ),
        Expanded(
          child: SizedBox(
            child: Divider(
              height: 1,
              color: Constants.KGrayColor,
            ),
          ),
        ),
      ],
    );
  }
}
