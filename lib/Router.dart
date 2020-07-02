import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/screens/Map2Screen.dart';
import 'package:servicerequest/screens/MapScreen.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case Constants.KMapRoute:
        return MaterialPageRoute(builder: (_) => MapScreen());
      case Constants.KMap2Route:
        return MaterialPageRoute(builder: (_) => Map2Screen());
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
