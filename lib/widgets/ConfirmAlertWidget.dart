import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
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
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.0),
          child: Text(
            " في حالة الغاء الطلب بعد الموعد ب 6 ساعات سوف يتم تطبيق غرامه",
            style: Constants.KConfirmSecondTextStyle,
            textAlign: TextAlign.center,
          ),
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
                onPress: () {
                  Provider.of<SelectServiceModel>(context, listen: false)
                      .request
                      .schesuleTime = DateTime.now().add(Duration(hours: 24));
                  Provider.of<SelectServiceModel>(context, listen: false)
                      .printReqeust();
                  Provider.of<SelectServiceModel>(context, listen: false)
                      .clearAllMarkersAndPutOnlyUserCurrentLocation();
                  Navigator.popAndPushNamed(
                      context, Constants.KChooseProviderScreen);
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}
