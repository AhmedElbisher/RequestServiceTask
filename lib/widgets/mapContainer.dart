import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/viewmodels/map_model.dart';

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
  LatLngBounds bounds;
  LatLng _lastMapPosition;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _lastMapPosition = LatLng(
        widget.currentPosition.latitude, widget.currentPosition.longitude);
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
    _controller.complete(controller);
    LatLngBounds bound = locator<MapModel>().calculateBounds();
    if (bound != null) {
      CameraUpdate u2 = CameraUpdate.newLatLngBounds(bound, 50);
      this.mapController.animateCamera(u2).then((void v) {
        check(u2, this.mapController);
      });
    }
  }

  void check(CameraUpdate u, GoogleMapController c) async {
    c.animateCamera(u);
    mapController.animateCamera(u);
    LatLngBounds l1 = await c.getVisibleRegion();
    LatLngBounds l2 = await c.getVisibleRegion();
    print(l1.toString());
    print(l2.toString());
    if (l1.southwest.latitude == -90 || l2.southwest.latitude == -90)
      check(u, c);
  }

  void _onCameraMove(CameraPosition position) {
    _lastMapPosition = position.target;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: GoogleMap(
        onCameraMove: _onCameraMove,
        markers: widget.markers,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng(widget.currentPosition.latitude,
              widget.currentPosition.longitude),
          zoom: 14.0,
        ),
      ),
    );
  }
}
