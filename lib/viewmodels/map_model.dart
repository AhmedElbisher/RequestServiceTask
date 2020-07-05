import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicerequest/viewmodels/base_model.dart';

class MapModel extends BaseModel {
  static List<Marker> _markers = [];
  static List<Marker> _singelMarkerList = [];
  static List<Position> _markerPositions = [];
  static Position _userPosition;
  static String _userPositionName;
  static bool _displayName;
  static GoogleMapController _mapController;

  List<Marker> get singelMarkerList => _singelMarkerList;
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

  void changeUserPosition(double lat, double lng) {
    if (mapController != null && lat != null)
      mapController.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: LatLng(lat, lng), zoom: 16)));
    setUserPosition(Position(longitude: lng, latitude: lat));
    addSingelMarker(
        userPosition, "images/location.png", "current position", 1, true);
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

  void addSingelMarker(Position position, String imagePath, String markerId,
      double alpha, bool k) async {
    ImageConfiguration imageConfiguration = ImageConfiguration();
    var bitmapDescriper =
        await BitmapDescriptor.fromAssetImage(imageConfiguration, imagePath);
    _singelMarkerList.clear();
    _singelMarkerList.add(Marker(
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

  void clearAllMarkers() {
    _markers.clear();
    _markerPositions.clear();
    notifyListeners();
  }

  void clearAllMarkersAndPutOnlyUserCurrentLocation() {
    clearAllMarkers();
    addMarkertoMap(
        userPosition, "images/location.png", "current position", 1, false);
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
  }
}
