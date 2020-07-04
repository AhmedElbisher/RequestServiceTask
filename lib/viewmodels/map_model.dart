import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicerequest/viewmodels/base_model.dart';

class MapModel extends BaseModel {
  static List<Marker> _markers = [];
  static List<Position> _markerPositions = [];
  static Position _userPosition;
  static String _userPositionName;
  static bool _displayName;
  GoogleMapController _mapController;

  GoogleMapController get mapController => _mapController;
  Position get userPosition => _userPosition;
  String get userPositionName => _userPositionName;
  bool get displayName => _displayName;
  List<Position> get markerPositions => _markerPositions;
  List<Marker> get markers => _markers;
  LatLngBounds bounds1;

  void setUserPosition(Position positinon) {
    _userPosition = positinon;
    notifyListeners();
  }

  void setUserPostionName(String value) {
    _userPositionName = value;
    notifyListeners();
  }

  void setDisplayName(bool state) {
    _displayName = state;
    notifyListeners();
  }

  void addMarkertoMap(Position position, String imagePath, String markerId,
      double alpha, bool k) async {
    _markerPositions.add(position);
    ImageConfiguration imageConfiguration = ImageConfiguration();
    var bitmapDescriper =
        await BitmapDescriptor.fromAssetImage(imageConfiguration, imagePath);
    _markers.add(Marker(
      alpha: alpha,
      markerId: MarkerId(markerId),
      position: LatLng(position.latitude, position.longitude),
      icon: bitmapDescriper,
    ));
    notifyListeners();
    if (mapController != null && k) {
      calculateBounds();
      animate();
    }
  }

  void clearAllMarkersAndPutOnlyOne() {
    _markers.clear();
    _markerPositions.clear();
    addMarkertoMap(
        userPosition, "images/marker.png", "current position", .65, false);
    notifyListeners();
  }

  LatLngBounds calculateBounds() {
    double south, nourth, west, east;
    if (_markerPositions.length > 1) {
      west = _markerPositions[0].longitude;
      east = _markerPositions[0].longitude;
      south = _markerPositions[0].latitude;
      nourth = _markerPositions[0].latitude;
      for (var markerposition in _markerPositions) {
        if (markerposition.longitude < west) west = markerposition.longitude;
        if (markerposition.longitude > east) east = markerposition.longitude;
        if (markerposition.latitude < south) south = markerposition.latitude;
        if (markerposition.latitude > nourth) nourth = markerposition.latitude;
      }
      bounds1 = LatLngBounds(
          southwest: LatLng(south, west), northeast: LatLng(nourth, east));
      return bounds1;
    }
    return null;
  }

  void setCameraControler(GoogleMapController c) {
    _mapController = c;
  }

  void animate() {
    CameraUpdate u2 = CameraUpdate.newLatLngBounds(bounds1, 50);
    mapController.animateCamera(u2);
//    then((void v) {
//      check(u2, mapController);
//    });
  }

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

  //todo delete this  its only for test
//  void addMarkers() {
//    addMarkertoMap(Position(latitude: 31.2240108, longitude: 29.93086),
//        "images/providerMarker.png", "aaaa", 1);
//    addMarkertoMap(Position(latitude: 31.2304821, longitude: 29.9498709),
//        "images/providerMarker.png", "aaaa", 1);
//    addMarkertoMap(Position(latitude: 31.2212284, longitude: 29.9342302),
//        "images/providerMarker.png", "bbb", 1);
//    calculateBounds();
//    animate();
//  }
}
