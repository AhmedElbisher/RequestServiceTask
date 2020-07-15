import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:servicerequest/locator.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/DateTime_model.dart';
import 'package:servicerequest/viewmodels/langauge_model.dart';
import 'package:servicerequest/viewmodels/map_model.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';

import 'Constants.dart';
import 'Router.dart';
import 'localization/AppLocalization.dart';

void main() async {
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  LocationService locationService = LocationService();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    locator<AppLanguage>().fetchLocale();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => locator<AppLanguage>(),
          ),
          ChangeNotifierProvider(
              create: (context) => locator<SelectServiceModel>()),
          ChangeNotifierProvider(create: (context) => locator<MapModel>()),
          FutureProvider(
            create: (context) => locator<DateTimeModel>().getdaysList(),
          )
        ],
        child: Consumer<AppLanguage>(
          builder: (context, model, child) => MaterialApp(
            debugShowCheckedModeBanner: false,
            locale: model.appLocal,
            supportedLocales: [Locale('en'), Locale('ar')],
            localizationsDelegates: [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            localeResolutionCallback: (Locale locale, supportedlocales) {
              for (var supportedlocale in supportedlocales) {
                if (locale.languageCode == supportedlocale.languageCode) {
                  return supportedlocale;
                }
              }
              return supportedlocales.first;
            },
            theme: ThemeData.light()
                .copyWith(scaffoldBackgroundColor: Constants.KLightGrayColor),
            initialRoute: Constants.KMainLoginScreen,
            onGenerateRoute: Router.generateRoute,
          ),
        ));
  }
}
