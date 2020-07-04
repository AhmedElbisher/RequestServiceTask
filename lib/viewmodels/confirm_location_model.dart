import 'package:geolocator/geolocator.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/map_model.dart';

class ConfirmLocationModel extends MapModel {
  LocationService _locationService = locator<LocationService>();

  void getCurrenPosition() async {
    setState(ViewState.BUSY);
    //  _userPosition = await _locationService.getCurrentLocation();
    //todo remove this
    setUserPosition(Position(latitude: 31.2216, longitude: 29.9343));
    if (userPosition != null)
      setUserPostionName(await _locationService.getPlaceName(userPosition));
    if (userPositionName != null) setDisplayName(true);
    if (userPosition != null)
      addMarkertoMap(
          userPosition, "images/marker.png", "current position", .65, false);
    setState(ViewState.IDLE);
    notifyListeners();
  }

  //todo delete this  its only for test
//  void addMarkers() {
//    addMarkertoMap(Position(latitude: 31.2240108, longitude: 29.93086),
//        "images/providerMarker.png", "aaaa", 1);
//    addMarkertoMap(Position(latitude: 31.2304821, longitude: 29.9498709),
//        "images/providerMarker.png", "aaaa", 1);
//    addMarkertoMap(Position(latitude: 31.2212284, longitude: 29.9342302),
//        "images/providerMarker.png", "bbb", 1);
//  }
}
