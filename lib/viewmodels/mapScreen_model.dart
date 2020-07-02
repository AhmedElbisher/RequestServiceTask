import 'package:geolocator/geolocator.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/map_model.dart';

class MapScreenModel extends MapModel {
  LocationService _locationService = locator<LocationService>();
  Position _userPosition;
  String _userPositionName;
  bool _displayName;

  Position get userPosition => _userPosition;
  String get userPositionName => _userPositionName;
  bool get displayName => _displayName;

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

  void getCurrenPosition() async {
    setState(ViewState.BUSY);
    //  _userPosition = await _locationService.getCurrentLocation();
    //todo remove this
    _userPosition = Position(latitude: 31.2216, longitude: 29.9343);
    if (_userPosition != null)
      _userPositionName = await _locationService.getPlaceName(_userPosition);
    if (_userPositionName != null) setDisplayName(true);
    if (_userPosition != null)
      addMarkertoMap(
          _userPosition, "images/marker.png", "current position", .65);
    setState(ViewState.IDLE);
    notifyListeners();
  }

  //todo delete this  its only for test
  void addMarkers() {
    addMarkertoMap(Position(latitude: 31.2240108, longitude: 29.93086),
        "images/providerMarker.png", "aaaa", 1);
    addMarkertoMap(Position(latitude: 31.2304821, longitude: 29.9498709),
        "images/providerMarker.png", "aaaa", 1);
    addMarkertoMap(Position(latitude: 31.2212284, longitude: 29.9342302),
        "images/providerMarker.png", "bbb", 1);
  }
}
