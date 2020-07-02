import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/screens/confirm_location.dart';
import 'package:servicerequest/screens/select_sevice.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case Constants.KMapRoute:
        return MaterialPageRoute(builder: (_) => ConfirmLocationScreen());
      case Constants.KMap2Route:
        return MaterialPageRoute(builder: (_) => SelectServiceScreen());
      default:
        return MaterialPageRoute(builder: (_) {
          return Scaffold(
            body: Center(
              child: Text("no screens for that root"),
            ),
          );
        });
    }
  }
}
