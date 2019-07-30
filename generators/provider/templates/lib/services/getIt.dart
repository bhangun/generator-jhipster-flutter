import 'package:get_it/get_it.dart';
import 'package:<%= appsName %>/modules/account/services/user_services.dart';
import 'package:<%= appsName %>/services/shared_preference_services.dart';
import 'package:<%= appsName %>/themes/theme_services.dart';
import 'navigation.dart';
import 'network/rest_dio_services.dart';
import 'network/rest_http_services.dart';

GetIt getIt = GetIt();

void setupgetIt() {
  getIt.registerLazySingleton(() => NavigationServices());
  getIt.registerLazySingleton(() => ThemeServices());
  getIt.registerLazySingleton(() => SharedPrefServices());
  getIt.registerLazySingleton(() => RestDioServices());
  getIt.registerLazySingleton(() => RestHttpServices());
  getIt.registerLazySingleton(() => UserServices());

}