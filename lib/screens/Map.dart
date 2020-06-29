import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/widgets/Button.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/SearchField.dart';
import 'package:servicerequest/widgets/WhiteBottomContainer.dart';
import 'package:servicerequest/widgets/mapContainer.dart';

import 'Map2.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  Position position;
  String currentPositionName;
  bool currentLocationContainerVisablitity = false;
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Provider.of<DataSource>(context, listen: false).getCurrenPosition();
    return Consumer<DataSource>(
      builder: (context, dataSource, child) {
        return Scaffold(
          body: dataSource.currentPosition != null
              ? SafeArea(
                  child: Stack(
                    children: [
                      MapContainer(
                        currentPosition: dataSource.currentPosition,
                      ),
                      Visibility(
                          visible:
                              dataSource.currentLocationContainerVisablitity,
                          child: WhiteBottomContainer(
                            cancelIconVisability: true,
                            onCancel: () {
                              dataSource.setCurrentLocationContainerVisablitity(
                                  false);
                            },
                            currentLocationName: dataSource.currentPostionName,
                          )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Button(
                            onPress: () {
                              dataSource.setStatus(Status.START);
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Map2()));
                            },
                            text: "تأكيد الموقع",
                          )),
                      Align(
                          alignment: Alignment.topCenter,
                          child: SearchField(
                            onSummitted: (quary) {
                              dataSource
                                  .setCurrentLocationContainerVisablitity(true);
                              //todo here will trigger a function to search for the location and retreive data from google places Api
                              //this for static data
                              dataSource.setCurrentPostionName(quary);
                            },
                            controller: controller,
                          )),
                      MenuIcon()
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                ),
        );
      },
    );
  }
}
