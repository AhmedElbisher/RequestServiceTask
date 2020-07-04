import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/Constants.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/map_model.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';

import 'Router.dart';

void main() {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  LocationService locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
              create: (context) => locator<SelectServiceModel>()),
          ChangeNotifierProvider(create: (context) => DataSource()),
          ChangeNotifierProvider(create: (context) => locator<MapModel>()),

//          ChangeNotifierProvider(
//              create: (context) => locator<ChooseProviderModel>()),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData.light(),
          initialRoute: Constants.KConfirmLocation,
          onGenerateRoute: Router.generateRoute,
        ));
  }
}
