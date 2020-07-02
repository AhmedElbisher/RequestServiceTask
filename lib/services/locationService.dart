import 'package:geolocator/geolocator.dart';

class LocationService {
  var geoLocator = Geolocator();

  Future<String> getPlaceName(Position p) async {
    List<Placemark> placemark = await geoLocator.placemarkFromCoordinates(
        p.latitude, p.longitude,
        localeIdentifier: 'ar');
    return "${placemark[0].name} ${placemark[0].locality}";
  }

  Future<Position> getCurrentLocation() async {
    Position location = await geoLocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low,
        locationPermissionLevel: GeolocationPermission.location);
    return location;
  }
}
