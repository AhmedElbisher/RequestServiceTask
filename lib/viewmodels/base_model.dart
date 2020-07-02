import 'package:flutter/cupertino.dart';
import 'package:servicerequest/enums/enums.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.IDLE;

  ViewState get state => _state;

  void setState(ViewState st) {
    _state = st;
    notifyListeners();
  }
}
