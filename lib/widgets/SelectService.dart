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
                      model.setSelectedService(Service.PERIODIC_CHECK);
                      model.setLocalNav(LocalNav.SELECT_TRANSPORTATION_METHOD);
                    },
                    text: Constants.PERIODIC_CHECK,
                    iconVisibility:
                        model.SelectedService == Service.PERIODIC_CHECK ||
                                model.SelectedService == null
                            ? true
                            : false,
                    iconPath: "images/car.png",
                  ),
                  CustomFlatButton(
                    dividerVisibility: true,
                    paddingValue: 20,
                    onPress: () {
                      model.setSelectedService(Service.MAINTAINANCE);
                      model.setLocalNav(LocalNav.SELECT_MAINTANANCE_TYPE);
                    },
                    text: Constants.MAINTAINANCE,
                    iconVisibility:
                        model.SelectedService == Service.MAINTAINANCE
                            ? true
                            : false,
                    iconPath: "images/wokshop.png",
                  ),
                  CustomFlatButton(
                    dividerVisibility: false,
                    paddingValue: 20,
                    onPress: () {
                      model.setSelectedService(Service.TIRES);
                      model.setLocalNav(LocalNav.SELSCT_NUMBER_OF_TIRES);
                    },
                    text: Constants.CHANGE_TIRES,
                    iconVisibility:
                        model.SelectedService == Service.TIRES ? true : false,
                    iconPath: "images/wheel.png",
                  )
                ]),
          ],
        ),
      );
    });
  }
}
