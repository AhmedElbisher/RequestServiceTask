import 'package:get_it/get_it.dart';
import 'package:servicerequest/services/locationService.dart';
import 'package:servicerequest/viewmodels/base_model.dart';
import 'package:servicerequest/viewmodels/mapScreen_model.dart';
import 'package:servicerequest/viewmodels/map_model.dart';

GetIt locator = GetIt.instance;
void setUpLocator() {
  //locator.registerLazySingleton(() => Router());
  locator.registerLazySingleton(() => BaseModel());
  locator.registerLazySingleton(() => MapScreenModel());
  locator.registerLazySingleton(() => LocationService());
  locator.registerLazySingleton(() => MapModel());
}
