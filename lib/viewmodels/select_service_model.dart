import 'package:flutter/material.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/model/request.dart';
import 'package:servicerequest/viewmodels/map_model.dart';
import 'package:servicerequest/widgets/InspectionMethod.dart';
import 'package:servicerequest/widgets/MaintainanceType.dart';
import 'package:servicerequest/widgets/SelectService.dart';
import 'package:servicerequest/widgets/StartRequest.dart';
import 'package:servicerequest/widgets/Tires.dart';

class SelectServiceModel extends MapModel {
  LocalNav _localNavigator;
  Request request = locator<Request>();

  LocalNav get localNavigator => _localNavigator;
  void setLocalNav(LocalNav localNav) {
    _localNavigator = localNav;
    notifyListeners();
  }

  void showBottomSheet(BuildContext context, Widget widget) {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.white.withOpacity(0.1),
        builder: (context) => widget);
  }

  Widget getProperWiget() {
    switch (localNavigator) {
      case LocalNav.START:
        return StartRequest(
          visibility: displayName,
          name: userPositionName,
          onPress: () {
            setLocalNav(LocalNav.SELECT_TRANSPORTATION_METHOD);
          },
        );
      case LocalNav.SELECT_SERVICE:
        return SelectService();
      case LocalNav.SELECT_TRANSPORTATION_METHOD:
        return InspectionMethod();
      case LocalNav.SELSCT_NUMBER_OF_TIRES:
        return Tires();
      case LocalNav.SELECT_MAINTANANCE_TYPE:
        return MaintainanceType();
      case LocalNav.No_Result:
        return null;
//      case Status.SELECT_PROVIDER:
//        return Container(
//          height: (MediaQuery.of(context).size.width * 2 / 5) + 20,
//          child: ListView(
//            shrinkWrap: true,
//            reverse: true,
//            scrollDirection: Axis.horizontal,
//            children: [
//              Column(
//                mainAxisSize: MainAxisSize.min,
//                children: [
//                  ProviderCard(
//                    name: "محمد ابن عبدالرحمن",
//                    rating: 4.0,
//                    normalCost: "200",
//                    offerCost: "150",
//                    imagePath: "images/profile.png",
//                    offerExists: true,
//                  ),
//                ],
//              ),
//              Column(
//                mainAxisSize: MainAxisSize.min,
//                children: [
//                  ProviderCard(
//                    name: "محمد ابن سعفان",
//                    rating: 3.0,
//                    normalCost: "120",
//                    imagePath: "images/profile.png",
//                    offerCost: "111",
//                    offerExists: false,
//                  ),
//                ],
//              )
//            ],
//          ),
//        );
    }
  }
}
