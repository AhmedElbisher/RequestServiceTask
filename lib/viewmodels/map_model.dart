import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicerequest/viewmodels/base_model.dart';

class MapModel extends BaseModel {
  Set<Marker> _markers = {};
  static List<Position> _markerPositions = [];

  List<Position> get markerPositions => _markerPositions;
  Set<Marker> get markers => _markers;

  void addMarkertoMap(Position position, String imagePath, String markerId,
      double alpha) async {
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
  }

  void clearAllMarkersAndPutOnlyOne(
      Position position, String imagePath, String markerId, double alpha) {
    _markers.clear();
    _markerPositions.clear();
    addMarkertoMap(position, imagePath, markerId, alpha);
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
      return LatLngBounds(
          southwest: LatLng(south, west), northeast: LatLng(nourth, east));
    }
    return null;
  }
}
