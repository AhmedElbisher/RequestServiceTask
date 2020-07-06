import 'package:geolocator/geolocator.dart';
import 'package:servicerequest/enums/enums.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/services/NetworkHelper.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/map_model.dart';

class ConfirmLocationModel extends MapModel {
  NetworkHelper networkHelper = locator<NetworkHelper>();
  LocationService _locationService = locator<LocationService>();
  bool _isSearching = false;
  bool get isSearching => _isSearching;

  void setIsSearching(bool val) {
    _isSearching = val;
    notifyListeners();
  }

  void getCurrenPosition() async {
    setState(ViewState.BUSY);
    Position position = await _locationService.getCurrentLocation();
    if (position != null) {
      setUserPosition(position);
      addSingelMarker(
          userPosition, "images/location.png", "current position", .65, true);
      setUserPostionName(await _locationService.getPlaceName(userPosition));
      if (userPositionName != null) setDisplayName(true);
    }
    setState(ViewState.IDLE);
    notifyListeners();
  }

  Future<void> searchforUserLocation(String quary) async {
    setIsSearching(true);
    dynamic jsonResponce = await networkHelper.getdata(quary);
    setIsSearching(false);
    if (jsonResponce != null) {
      setUserPostionName(jsonResponce["candidates"][0]["name"] as String);
      double lat = jsonResponce["candidates"][0]["geometry"]["location"]["lat"]
          as double;
      double lng = jsonResponce["candidates"][0]["geometry"]["location"]["lng"]
          as double;
      changeUserPosition(lat, lng);
    } else {
      setUserPostionName("لا يوجد مكان باسم $quary");
    }
  }
}
