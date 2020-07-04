import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/model/ProviderInfo.dart';
import 'package:servicerequest/model/request.dart';
import 'package:servicerequest/viewmodels/map_model.dart';
import 'package:servicerequest/widgets/InspectionMethod.dart';
import 'package:servicerequest/widgets/MaintainanceType.dart';
import 'package:servicerequest/widgets/SelectService.dart';
import 'package:servicerequest/widgets/StartRequest.dart';
import 'package:servicerequest/widgets/Tires.dart';

import '../locator.dart';

class SelectServiceModel extends MapModel {
  Request _request = locator<Request>();
  LocalNav _localNavigator;
  Service _SelectedService;
  NumberOfTires _numberOfTires;
  Inspection _inspectionMethod;
  Maintainance _maintainance;

  Inspection get inspectionMethod => _inspectionMethod;
  Maintainance get maintainance => _maintainance;
  NumberOfTires get numberOfTires => _numberOfTires;
  Service get SelectedService => _SelectedService;
  Request get request => _request;
  LocalNav get localNavigator => _localNavigator;

  void setInspectionMethod(Inspection value) {
    _inspectionMethod = value;
    request.inspectionMethod = value;
    notifyListeners();
  }

  void setMaintainance(Maintainance value) {
    _maintainance = value;
    request.maintainance = value;
    notifyListeners();
  }

  void setNumberOfTires(NumberOfTires value) {
    _numberOfTires = value;
    request.numberOfTires = value;
    notifyListeners();
  }

  void setSelectedService(Service value) {
    _SelectedService = value;
    request.SelectedService = value;
    notifyListeners();
  }

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

  void back(BuildContext context) {
    switch (localNavigator) {
      case LocalNav.SELECT_TRANSPORTATION_METHOD:
      case LocalNav.SELSCT_NUMBER_OF_TIRES:
      case LocalNav.SELECT_MAINTANANCE_TYPE:
        setLocalNav(LocalNav.SELECT_SERVICE);
        break;
      case LocalNav.SELECT_SERVICE:
      case LocalNav.No_Result:
        setLocalNav(LocalNav.START);
        break;
      case LocalNav.START:
        Navigator.of(context).pop();
        break;
    }
  }

//todo hit the api with details of request fetch the available consumer or git no result
  Future<dynamic> delayTosimulateCallingApi() {
    return Future.delayed(Duration(seconds: 5));
  }

  Future<List<ProviderInfo>> getAvailableProviders() async {
    List<ProviderInfo> providers = [];
    await delayTosimulateCallingApi();
    providers.add(ProviderInfo(
        name: "محمد3 ابن عبدالرحمن",
        rating: 4.0,
        cost: "200",
        offerCost: "150",
        pictureUrl: "images/profile.png",
        position: Position(latitude: 31.2240108, longitude: 29.93086)));
    providers.add(ProviderInfo(
        name: "محمد 2ابن عبدالرحمن",
        rating: 4.0,
        cost: "200",
        offerCost: "150",
        pictureUrl: "images/profile.png",
        position: Position(latitude: 31.2304821, longitude: 29.9498709)));
    providers.add(ProviderInfo(
        name: "محمد 1ابن عبدالرحمن",
        rating: 4.0,
        cost: "200",
        offerCost: "150",
        pictureUrl: "images/profile.png",
        position: Position(latitude: 31.2212284, longitude: 29.9342302)));
    //addMarkers();
    return providers;
  }

  Widget getProperWiget() {
    switch (localNavigator) {
      case LocalNav.START:
        return StartRequest(
          visibility: displayName,
          name: userPositionName,
          onPress: () {
            setSelectedService(Service.PERIODIC_CHECK);
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
    }
  }

  void printReqeust() {
    String reqeustString = "";
    switch (request.SelectedService) {
      case Service.MAINTAINANCE:
        reqeustString += Constants.MAINTAINANCE + " ";
        switch (request.maintainance) {
          case Maintainance.ELECTRICAL:
            reqeustString += Constants.MAINTAINANCE_ELECTICAL + " ";
            break;
          case Maintainance.MECHANICAL:
            reqeustString += Constants.MAINTAINANCE_MECHANICAL + " ";
            break;
          case Maintainance.OTHER:
            reqeustString += Constants.MAINTAINANCE_OTHER + " ";
            break;
        }
        break;
      case Service.PERIODIC_CHECK:
        reqeustString += Constants.PERIODIC_CHECK + " ";
        switch (request.inspectionMethod) {
          case Inspection.WINCH:
            reqeustString += Constants.INSPECTION_WINCH;
            break;
          case Inspection.SERVICE_PROVIDER_HIMSELF:
            reqeustString += Constants.INSPECTION_PROVIDER_HIMSELF;
            break;
        }
        break;
      case Service.TIRES:
        reqeustString += Constants.CHANGE_TIRES + " ";
        switch (request.numberOfTires) {
          case NumberOfTires.ONE:
            reqeustString += Constants.ONE_TIRE + " ";
            break;
          case NumberOfTires.TWO:
            reqeustString += Constants.TWO_TIRE + " ";
            break;
          case NumberOfTires.TREE:
            reqeustString += Constants.THREE_TIRE + " ";
            break;
          case NumberOfTires.FOUR:
            reqeustString += Constants.FOUR_TIRE + " ";
            break;
        }
    }
    reqeustString += request.schesuleTime.toString();
    print(reqeustString);
  }
}
