import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/ConfirmAlertWidget.dart';
import 'package:servicerequest/widgets/ConfirmButton.dart';
import 'package:servicerequest/widgets/CustomBottomSheetContainer.dart';
import 'package:servicerequest/widgets/ScheduleWidget.dart';
import 'package:servicerequest/widgets/grayLine.dart';

class BottomSheetWidget extends StatelessWidget {
  final String cost;
  final String serviceName;
  final String imagePath;
  final String serviceDetailsString;
  BottomSheetWidget(
      {this.cost, this.serviceName, this.imagePath, this.serviceDetailsString});

  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(
      builder: (context, model, child) => CustomBottomSheetContainer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GrayLine(),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
              color: Color(0xfff1f1f1),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "$cost SRA",
                    style: Constants.KProviderTextStyle,
                  ),
                  Expanded(
                    child: Text(
                      serviceName,
                      textAlign: TextAlign.end,
                      style: Constants.KProviderTextStyle,
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    height: 40.0,
                    width: 40.0,
                    child: Image(
                      image: AssetImage(imagePath),
                    ),
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.arrow_back_ios, size: 15),
                    Expanded(
                      child: Text(
                        serviceDetailsString,
                        textAlign: TextAlign.end,
                        style: TextStyle(
                            color: Color(0xff9e9999),
                            fontWeight: FontWeight.w700,
                            fontSize: 20),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 45,
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      model.setState(ViewState.BUSY);
                      model.showBottomSheet(context, ScheduleWidget());
                    },
                    child: Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          color: Constants.KPrimaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Material(
                          elevation: 4,
                          color: Constants.KPrimaryColor,
                          child: Image(
                            width: 40,
                            height: 40,
                            image: AssetImage("images/date.png"),
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Expanded(
                      child: ConfirmButton(
                    text: "تأكيد",
                    onPress: () {
                      showDialog(
                          context: context,
                          builder: (context) => ConfirmAlertWidget());
                    },
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
