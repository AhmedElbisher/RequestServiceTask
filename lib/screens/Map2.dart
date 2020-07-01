import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/widgets/BackArrow.dart';
import 'package:servicerequest/widgets/BottomSheetWidget.dart';
import 'package:servicerequest/widgets/InspectionMethod.dart';
import 'package:servicerequest/widgets/MaintainanceType.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/ProviderCard.dart';
import 'package:servicerequest/widgets/SelectService.dart';
import 'package:servicerequest/widgets/StartRequest.dart';
import 'package:servicerequest/widgets/Tires.dart';
import 'package:servicerequest/widgets/mapContainer.dart';

class Map2 extends StatefulWidget {
  @override
  _Map2State createState() => _Map2State();
}

class _Map2State extends State<Map2> {
  void showBottomSheet() {
    showModalBottomSheet(
        context: context,
        barrierColor: Colors.white.withOpacity(0.1),
        builder: (context) => BottomSheetWidget());
  }

  Widget getProperWiget(Status status) {
    switch (status) {
      case Status.START:
        return StartRequest(
          onPress: () {
            Provider.of<DataSource>(context, listen: false)
                .setStatus(Status.SELECT_SERVICE);
          },
        );
      case Status.SELECT_SERVICE:
        return SelectService();
      case Status.SELECT_TRANSPORTATION_METHOD:
        return InspectionMethod();
      case Status.SELSCT_NUMBER_OF_TIRES:
        return Tires();
      case Status.SELECT_MAINTANANCE_TYPE:
        return MaintainanceType();
      case Status.No_Result:
        return null;
      case Status.SELECT_PROVIDER:
        return Container(
          height: (MediaQuery.of(context).size.width * 2 / 5) + 20,
          child: ListView(
            shrinkWrap: true,
            reverse: true,
            scrollDirection: Axis.horizontal,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProviderCard(
                    name: "محمد ابن عبدالرحمن",
                    rating: 4.0,
                    normalCost: "200",
                    offerCost: "150",
                    imagePath: "images/profile.png",
                    offerExists: true,
                  ),
                ],
              ),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ProviderCard(
                    name: "محمد ابن سعفان",
                    rating: 3.0,
                    normalCost: "120",
                    imagePath: "images/profile.png",
                    offerCost: "111",
                    offerExists: false,
                  ),
                ],
              )
            ],
          ),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DataSource>(
      builder: (context, dataSource, child) {
        return Scaffold(
          body: SafeArea(
            child: Stack(
              children: [
                MapContainer(
                  currentPosition: dataSource.currentPosition,
                ),
                MenuIcon(),
                Align(
                    alignment: Alignment.bottomCenter,
                    child: getProperWiget(dataSource.status)),
                BackArrow(
                  back: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
//if (Provider.of<DataSource>(context).status == Status.No_Result) {
//showDialog(
//context: context,
//builder: (context) {
//return AlertDialog(
//title: Text("no result"),
//);
//});
//}
