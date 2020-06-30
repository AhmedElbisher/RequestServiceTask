import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:servicerequest/services/locationService.dart';

enum Status {
  START,
  SELECT_SERVICE,
  SELECT_TRANSPORTATION_METHOD,
  SELSCT_NUMBER_OF_TIRES,
  SELECT_MAINTANANCE_TYPE,
  SELECT_PROVIDER,
  No_Result,
}
enum Service { MAINTAINANCE, TIRES, PERIODIC_CHECK }
enum NumberOfTires { ONE, TWO, TREE, FOUR }
enum Inspection { WINCH, SERVICE_PROVIDER_HIMSELF }
enum Maintainance { ELECTRICAL, MECHANICAL, OTHER }

class DataSource extends ChangeNotifier {
  var _locationService = LocationService();

  Position _currentPosition = Position(latitude: 31.2216, longitude: 29.9343);
  String _currentPostionName = "";
  bool _currentLocationContainerVisablitity = false;
  Status _status;
  Service _selectedService = Service.PERIODIC_CHECK;
  NumberOfTires _selectedNumberOfTires = NumberOfTires.ONE;
  Inspection _inspection = Inspection.WINCH;
  Maintainance _maintainance = Maintainance.ELECTRICAL;
  Set<Marker> _markers = {};

  //set selected maintainance method
  Maintainance get maintainance => _maintainance;
  void setSelectedMaintainaceMethod(Maintainance method) {
    _maintainance = method;
    notifyListeners();
  }

  //add marker
  Set<Marker> get markers => _markers;
  void addMrkeratPositions(Position position, String imagePath, String markerId,
      double alpha) async {
    ImageConfiguration imageConfiguration = ImageConfiguration();
    var bitmapDescriper =
        await BitmapDescriptor.fromAssetImage(imageConfiguration, imagePath);
    markers.add(Marker(
      alpha: alpha,
      markerId: MarkerId(markerId),
      position: LatLng(position.latitude, position.longitude),
      icon: bitmapDescriper,
    ));
    notifyListeners();
  }

  //test add markers
  void addMarkers() {
    addMrkeratPositions(Position(latitude: 31.2204669, longitude: 29.9330876),
        "images/providerMarker.png", "aaaa", 1);
    addMrkeratPositions(Position(latitude: 31.2212284, longitude: 29.9342302),
        "images/providerMarker.png", "bbb", 1);
  }

  //set check mark on the selected inspection method
  Inspection get inspection => _inspection;
  void setInspectionMetod(Inspection insp) {
    _inspection = insp;
    notifyListeners();
  }

  // set the position
  Position get currentPosition => _currentPosition;
  set currentPosition(Position value) {
    _currentPosition = value;
  }

  void setPosition(Position positinon) {
    _currentPosition = positinon;
    notifyListeners();
  }

  //get position from location service
  void getCurrenPosition() async {
    addMrkeratPositions(
        currentPosition, "images/marker.png", "current position", .65);
    currentPosition = await _locationService.getCurrentLocation();
    notifyListeners();
  }

  // display check mark on the selected Service
  Service get selectedService => _selectedService;
  void setSelectedService(Service service) {
    _selectedService = service;
    notifyListeners();
  }

  //hide/display the white container which display the location name
  bool get currentLocationContainerVisablitity =>
      _currentLocationContainerVisablitity;
  void setCurrentLocationContainerVisablitity(bool status) {
    _currentLocationContainerVisablitity = status;
  }

  //which widget is visable to user in map2
  Status get status => _status;
  void setStatus(Status st) {
    _status = st;
    notifyListeners();
    if (st == Status.No_Result) {}
  }

  //set the name of the current position
  String get currentPostionName => _currentPostionName;
  void setCurrentPostionName(String value) {
    _currentPostionName = value;
    notifyListeners();
  }

  //show check mark on selected number of tires
  NumberOfTires get selectedNumberOfTires => _selectedNumberOfTires;
  void setSelectedNumberOfTire(NumberOfTires numberOfTires) {
    _selectedNumberOfTires = numberOfTires;
    notifyListeners();
  }
}
