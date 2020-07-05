import 'package:get_it/get_it.dart';
import 'package:servicerequest/model/request.dart';
import 'package:servicerequest/services/NetworkHelper.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/DateTime_model.dart';
import 'package:servicerequest/viewmodels/base_model.dart';
import 'package:servicerequest/viewmodels/confirm_location_model.dart';
import 'package:servicerequest/viewmodels/map_model.dart';
import 'package:servicerequest/viewmodels/select_service_model.dart';

import 'Router.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  locator.registerLazySingleton(() => Router());
  locator.registerLazySingleton(() => BaseModel());
  locator.registerLazySingleton(() => ConfirmLocationModel());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => MapModel());
  locator.registerLazySingleton(() => SelectServiceModel());
  locator.registerLazySingleton(() => Request());
  locator.registerLazySingleton(() => DateTimeModel());
  locator.registerLazySingleton(() => NetworkHelper());

  //locator.registerLazySingleton(() => ChooseProviderModel());
}
