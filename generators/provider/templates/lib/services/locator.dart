import 'package:get_it/get_it.dart';
import 'package:jh_flutter_provider/modules/account/helper/user_services.dart';
import 'package:jh_flutter_provider/services/shared_preference_services.dart';
import 'package:jh_flutter_provider/themes/theme_services.dart';
import 'navigation.dart';
import 'network/rest_dio_services.dart';
import 'network/rest_http_services.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => NavigationServices());
  locator.registerLazySingleton(() => ThemeServices());
  locator.registerLazySingleton(() => SharedPrefServices());
  locator.registerLazySingleton(() => RestDioServices());
  locator.registerLazySingleton(() => RestHttpServices());
  locator.registerLazySingleton(() => UserServices());

}