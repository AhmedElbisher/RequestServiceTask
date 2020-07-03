import 'package:geolocator/geolocator.dart';

class ProviderInfo {
  String _name;
  String _pictureUrl;
  String _offerCost; //null if it not exist
  String _cost;
  String _phoneNumber;
  double _rating;
  Position _position;

  String get pictureUrl => _pictureUrl;

  set pictureUrl(String value) {
    _pictureUrl = value;
  }

  ProviderInfo(
      {name, pictureUrl, offerCost, cost, phoneNumber, rating, position}) {
    _name = name;
    _pictureUrl = pictureUrl;
    _offerCost = offerCost;
    _cost = cost;
    _phoneNumber = phoneNumber;
    _rating = rating;
    _position = position;
  }

  Position get position => _position;

  set position(Position value) {
    _position = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  double get rating => _rating;

  set rating(double value) {
    _rating = value;
  }

  String get phoneNumber => _phoneNumber;

  set phoneNumber(String value) {
    _phoneNumber = value;
  }

  String get cost => _cost;

  set cost(String value) {
    _cost = value;
  }

  String get offerCost => _offerCost;

  set offerCost(String value) {
    _offerCost = value;
  }
}
