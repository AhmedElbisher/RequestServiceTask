import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/widgets/CustomFlatButton.dart';

class SelectService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<DataSource>(builder: (context, dataSource, Widget) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Constants.KPrimaryColor,
        child: Wrap(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomFlatButton(
                    onPress: () {
                      dataSource.setSelectedService(Service.PERIODIC_CHECK);
                      dataSource.setStatus(Status.SELECT_TRANSPORTATION_METHOD);
                    },
                    text: "الفحص الدورى للسيارة",
                    iconVisibility:
                        dataSource.selectedService == Service.PERIODIC_CHECK
                            ? true
                            : false,
                    iconPath: "images/car.png",
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                  CustomFlatButton(
                    onPress: () {
                      dataSource.setSelectedService(Service.MAINTAINANCE);
                      dataSource.setStatus(Status.SELECT_MAINTANANCE_TYPE);
                    },
                    text: "صيانة السيارة",
                    iconVisibility:
                        dataSource.selectedService == Service.MAINTAINANCE
                            ? true
                            : false,
                    iconPath: "images/wokshop.png",
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.white,
                      height: 2,
                    ),
                  ),
                  CustomFlatButton(
                    onPress: () {
                      dataSource.setSelectedService(Service.TIRES);
                      dataSource.setStatus(Status.SELSCT_NUMBER_OF_TIRES);
                    },
                    text: "تغيير الايطار",
                    iconVisibility: dataSource.selectedService == Service.TIRES
                        ? true
                        : false,
                    iconPath: "images/wheel.png",
                  )
                ]),
          ],
        ),
      );
    });
  }
}
