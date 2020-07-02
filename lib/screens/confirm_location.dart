import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/viewmodels/confirm_location_model.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/Button.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/SearchField.dart';
import 'package:servicerequest/widgets/WhiteBottomContainer.dart';
import 'package:servicerequest/widgets/baseview.dart';
import 'package:servicerequest/widgets/mapContainer.dart';

class ConfirmLocationScreen extends StatefulWidget {
  @override
  _ConfirmLocationScreenState createState() => _ConfirmLocationScreenState();
}

class _ConfirmLocationScreenState extends State<ConfirmLocationScreen> {
  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Provider.of<DataSource>(context, listen: false).getCurrenPosition();
    return BaseView<ConfirmLocationModel>(
      onMapReady: (model) {
        model.getCurrenPosition();
      },
      builder: (context, model, child) {
        return Scaffold(
          body: model.state == ViewState.IDLE
              ? SafeArea(
                  child: Stack(
                    children: [
                      MapContainer(
                        markers: model.markers.toSet(),
                        currentPosition: model.userPosition,
                      ),
                      Visibility(
                          visible: model.displayName,
                          child: WhiteBottomContainer(
                            cancelIconVisability: true,
                            onCancel: () {
                              model.setUserPostionName(null);
                              model.setDisplayName(false);
                            },
                            currentLocationName: model.userPositionName,
                          )),
                      Align(
                          alignment: Alignment.bottomCenter,
                          child: Button(
                            onPress: () {
                              Provider.of<SelectServiceModel>(context,
                                      listen: false)
                                  .setLocalNav(LocalNav.START);
                              Navigator.pushNamed(
                                  context, Constants.KMap2Route);
                            },
                            text: "تأكيد الموقع",
                          )),
                      Align(
                          alignment: Alignment.topCenter,
                          child: SearchField(
                            onSummitted: (quary) {
                              //todo here will trigger a function to search for the location and retreive data from google places Api
                              // set the userposition to the new postition
                              //set the name to the new name
                              //set displayname to true
                              //navigate the camera to it
                              // static data for testing ui

                              model.setDisplayName(true);
                              model.setUserPostionName(quary);
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
