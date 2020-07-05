import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/model/ProviderInfo.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';
import 'package:servicerequest/widgets/BackArrow.dart';
import 'package:servicerequest/widgets/MenuIcon.dart';
import 'package:servicerequest/widgets/ProviderCard.dart';
import 'package:servicerequest/widgets/mapContainer.dart';

class ChooseProviderScreen extends StatefulWidget {
  @override
  _ChooseProviderScreenState createState() => _ChooseProviderScreenState();
}

class _ChooseProviderScreenState extends State<ChooseProviderScreen> {
  @override
  Widget build(BuildContext context) {
    return Consumer<SelectServiceModel>(
        builder: (context, model, child) => FutureProvider(
              create: (_) => model.getAvailableProviders(context),
              child: Consumer<List<ProviderInfo>>(
                builder: (context, providerslist, child) => Stack(
                  children: [
                    MapContainer(
                      markers: model.markers.toSet(),
                      currentPosition: model.userPosition,
                    ),
                    MenuIcon(),
                    BackArrow(back: () {
                      model.clearAllMarkersAndPutOnlyUserCurrentLocation();
                      Navigator.pop(context);
                    }),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: providerslist == null
                          ? Center(
                              child: Container(
                                child: SpinKitDoubleBounce(
                                  size: 50,
                                  color: Constants.KPrimaryColor,
                                ),
                              ),
                            )
                          : Container(
                              height:
                                  (MediaQuery.of(context).size.width * 2 / 5) +
                                      20,
                              child: ListView.builder(
                                shrinkWrap: true,
                                reverse: true,
                                scrollDirection: Axis.horizontal,
                                itemCount: providerslist.length < 2
                                    ? providerslist.length
                                    : 2,
                                itemBuilder: (context, index) {
                                  model.addMarkertoMap(
                                      providerslist[index].position,
                                      "images/providerMarker.png",
                                      providerslist[index].name,
                                      .75,
                                      true);
                                  return Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      ProviderCard(
                                        onCancel: () {
                                          model
                                              .clearAllMarkersAndPutOnlyUserCurrentLocation();
                                          providerslist.removeAt(index);
                                          print("cancel");
                                        },
                                        onConfirm: () {
                                          print("confirmed");
                                        },
                                        name: providerslist[index].name,
                                        rating: providerslist[index].rating,
                                        normalCost: providerslist[index].cost,
                                        offerCost:
                                            providerslist[index].offerCost,
                                        imagePath:
                                            providerslist[index].pictureUrl,
                                        offerExists: true,
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                    )
                  ],
                ),
              ),
            ));
  }
}
