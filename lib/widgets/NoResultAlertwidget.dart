import 'package:flutter/material.dart';

import '../Constants.dart';
import 'AlertDialogContainer.dart';

class NoResultAlertwidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogContainer(childern: [
      Image(
        image: AssetImage("images/noCar.png"),
      ),
      Text(
        "لا يوجد نتائج حاول مره اخرى",
        textAlign: TextAlign.center,
        style: TextStyle(
            fontSize: 30,
            color: Constants.KPrimaryColor,
            fontWeight: FontWeight.w500),
      ),
    ]);
  }
}
