import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/widgets/AlertDialogContainer.dart';
import 'package:servicerequest/widgets/ConfirmButton.dart';

class ConfirmAlertWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AlertDialogContainer(
      childern: [
        Text(
          "سوف تتم الخدمه خلال 24 ساعه",
          style: Constants.KConfirmFirestTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "في حالة الغاء الطلب بعد الموعد",
          style: Constants.KConfirmSecondTextStyle,
          textAlign: TextAlign.center,
        ),
        Text(
          "ب 6 ساعات سوف يتم تطبيق غرامه",
          style: Constants.KConfirmSecondTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "20:00:00",
          style: Constants.KConfirmTimeTextStyle,
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 16,
        ),
        Row(
          children: [
            Expanded(
              child: ConfirmButton(
                text: "تاكيد الحجز",
                onPress: () {},
              ),
            ),
          ],
        )
      ],
    );
  }
}
