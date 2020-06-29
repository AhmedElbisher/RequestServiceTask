import 'package:geolocator/geolocator.dart';

class LocationService {
  var geoLocator = Geolocator();

  Future<List<Placemark>> getPlaceMark(Position p) async {
    List<Placemark> placemark = await geoLocator.placemarkFromCoordinates(
        p.latitude, p.longitude,
        localeIdentifier: 'ar');
    for (var placemar in placemark) {
      print(placemark[0].name +
          ' ' +
          placemark[0].locality +
          ' ' +
          placemark[0].administrativeArea);
    }
    return placemark;
  }

  Future<Position> getCurrentLocation() async {
    Position location = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        locationPermissionLevel: GeolocationPermission.location);
    return location;
  }
}
