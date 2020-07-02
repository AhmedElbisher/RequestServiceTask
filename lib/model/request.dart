import 'package:geolocator/geolocator.dart';
import 'package:servicerequest/enums/enums.dart';

class Request {
  static Position _userPosition;
  static Service _SelectedService;
  static NumberOfTires _numberOfTires;
  static Inspection _inspectionMethod;
  static Maintainance _maintainance;

  Position get userPosition => _userPosition;

  set userPosition(Position value) {
    _userPosition = value;
  }

  Service get SelectedService => _SelectedService;

  set SelectedService(Service value) {
    _SelectedService = value;
  }

  Maintainance get maintainance => _maintainance;

  set maintainance(Maintainance value) {
    _maintainance = value;
  }

  Inspection get inspectionMethod => _inspectionMethod;

  set inspectionMethod(Inspection value) {
    _inspectionMethod = value;
  }

  NumberOfTires get numberOfTires => _numberOfTires;

  set numberOfTires(NumberOfTires value) {
    _numberOfTires = value;
  }
}
