import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
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
                        markers: model.singelMarkerList.toSet(),
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
                              Provider.of<SelectServiceModel>(context,
                                      listen: false)
                                  .request
                                  .userPosition = model.userPosition;
                              Navigator.pushNamed(
                                  context, Constants.KSELECTSERVICEScreen);
                            },
                            text: "تأكيد الموقع",
                          )),
                      Align(
                        alignment: Alignment.center,
                        child: model.isSearching
                            ? SpinKitDoubleBounce(
                                color: Constants.KPrimaryColor,
                                size: 50.0,
                              )
                            : null,
                      ),
                      Align(
                          alignment: Alignment.topCenter,
                          child: SearchField(
                            onSummitted: (quary) {
                              model.searchforUserLocation(quary);
                              model.setDisplayName(true);
                            },
                            controller: controller,
                          )),
                      MenuIcon()
                    ],
                  ),
                )
              : Center(
                  child: Container(
                    color: Constants.KPrimaryColor,
                    child: SpinKitDoubleBounce(
                      color: Colors.white,
                      size: 50.0,
                    ),
                  ),
                ),
        );
      },
    );
  }
}
