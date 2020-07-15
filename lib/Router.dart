import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/screens/choose_provider_screen.dart';
import 'package:servicerequest/screens/confirm_location.dart';
import 'package:servicerequest/screens/logIn/PhoneLoginScreen.dart';
import 'package:servicerequest/screens/logIn/VerificationCodeScreen.dart';
import 'package:servicerequest/screens/logIn/mainLoginScreen.dart';
import 'package:servicerequest/screens/select_sevice.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings sittings) {
    switch (sittings.name) {
      case Constants.KConfirmLocationScreen:
        return MaterialPageRoute(builder: (_) => ConfirmLocationScreen());
      case Constants.KSELECTSERVICEScreen:
        return MaterialPageRoute(builder: (_) => SelectServiceScreen());
      case Constants.KChooseProviderScreen:
        return MaterialPageRoute(builder: (_) => ChooseProviderScreen());
      case Constants.KMainLoginScreen:
        return MaterialPageRoute(builder: (_) => MainLoginScreen());
      case Constants.KPhoneLoginScreen:
        return MaterialPageRoute(builder: (_) => PhoneLoginScreen());
      case Constants.KVerificationCodeScreen:
        return MaterialPageRoute(builder: (_) => VerificationCodeScreen());
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
