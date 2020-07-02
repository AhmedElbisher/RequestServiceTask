import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/CustomFlatButton.dart';

import '../Constants.dart';

class SelectService extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(builder: (context, model, Widget) {
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        color: Constants.KPrimaryColor,
        child: Wrap(
          children: [
            Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomFlatButton(
                    dividerVisibility: true,
                    paddingValue: 20,
                    onPress: () {
                      model.request.SelectedService = Service.PERIODIC_CHECK;
                      model.setLocalNav(LocalNav.SELECT_TRANSPORTATION_METHOD);
                    },
                    text: "الفحص الدورى للسيارة",
                    iconVisibility:
                        model.request.SelectedService == Service.PERIODIC_CHECK
                            ? true
                            : false,
                    iconPath: "images/car.png",
                  ),
                  CustomFlatButton(
                    dividerVisibility: true,
                    paddingValue: 20,
                    onPress: () {
                      model.request.SelectedService = Service.MAINTAINANCE;
                      model.setLocalNav(LocalNav.SELECT_MAINTANANCE_TYPE);
                    },
                    text: "صيانة السيارة",
                    iconVisibility:
                        model.request.SelectedService == Service.MAINTAINANCE
                            ? true
                            : false,
                    iconPath: "images/wokshop.png",
                  ),
                  CustomFlatButton(
                    dividerVisibility: false,
                    paddingValue: 20,
                    onPress: () {
                      model.request.SelectedService = Service.TIRES;
                      model.setLocalNav(LocalNav.SELSCT_NUMBER_OF_TIRES);
                    },
                    text: "تغيير الايطار",
                    iconVisibility:
                        model.request.SelectedService == Service.TIRES
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
