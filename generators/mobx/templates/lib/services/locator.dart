import 'package:get_it/get_it.dart';
import 'package:jh_flutter_mobx/themes/theme_service.dart';
import 'navigation.dart';

GetIt getIt = GetIt();

void setupgetIt() {
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => ThemeService());
}