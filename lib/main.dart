import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/DataSource.dart';
import 'package:servicerequest/screens/Map.dart';
import 'package:servicerequest/services/locationService.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  LocationService locationService = LocationService();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DataSource>(
        create: (context) => DataSource(),
        builder: (context, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.light(),
            home: MapScreen(),
          );
        });
  }
}
