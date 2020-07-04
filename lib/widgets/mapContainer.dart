import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';

class MapContainer extends StatefulWidget {
  final Position currentPosition;
  final Set<Marker> markers;
  MapContainer({this.currentPosition, this.markers});

  @override
  _MapContainerState createState() => _MapContainerState();
}

class _MapContainerState extends State<MapContainer> {
  Completer<GoogleMapController> _controller = Completer();
  GoogleMapController mapController;

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    Provider.of<SelectServiceModel>(context, listen: false)
        .setCameraControler(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        minMaxZoomPreference: MinMaxZoomPreference(10, 14),
        onMapCreated: _onMapCreated,
        markers: widget.markers,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.currentPosition.latitude,
              widget.currentPosition.longitude),
          zoom: 14.0,
        ),
      ),
    );
  }
}

//
//  void check(CameraUpdate u, GoogleMapController c) async {
//    c.animateCamera(u);
//    mapController.animateCamera(u);
//    LatLngBounds l1 = await c.getVisibleRegion();
//    LatLngBounds l2 = await c.getVisibleRegion();
//    print(l1.toString());
//    print(l2.toString());
//    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
//      check(u, c);
//  }
//
//  void _onCameraMove(CameraPosition position) {
//    _lastMapPosition = position.target;
//  }

//void _onMapCreated(GoogleMapController controller) {
//  mapController = controller;
//  _controller.complete(controller);
//  Provider.of<SelectServiceModel>(context, listen: false)
//      .setCameraControler(controller);
//    LatLngBounds bound = locator<MapModel>().calculateBounds();
//    if (bound != null) {
//      CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
//      mapController.animateCamera(u2).then((void v) {
//        check(u2, mapController);
//      });
//}
