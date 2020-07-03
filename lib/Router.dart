import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/screens/choose_provider_screen.dart';
import 'package:servicerequest/screens/confirm_location.dart';
import 'package:servicerequest/screens/select_sevice.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case Constants.KConfirmLocation:
        return MaterialPageRoute(builder: (_) => ConfirmLocationScreen());
      case Constants.KSELECTSERVICE:
        return MaterialPageRoute(builder: (_) => SelectServiceScreen());
      case Constants.KChooseProvider:
        return MaterialPageRoute(builder: (_) => ChooseProviderScreen());
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
