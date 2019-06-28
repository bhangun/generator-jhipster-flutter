import 'package:get_it/get_it.dart';
import 'package:jh_flutter_mobx/themes/theme_service.dart';
import 'navigation.dart';

GetIt locator = GetIt();

void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => ThemeService());
}