
import 'package:<%= appsName %>/models/module.dart';
import 'package:<%= appsName %>/services/apps_routes.dart';
import 'package:<%= appsName %>/services/navigation.dart';
import 'package:<%= appsName %>/services/network/rest_dio_services.dart';
import 'package:<%= appsName %>/services/network/rest_http_services.dart';
import 'package:<%= appsName %>/services/shared_preference_services.dart';
import 'package:<%= appsName %>/themes/theme_services.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/utils/routes.dart';
import 'account/services/user_routes.dart';
import 'account/services/user_services.dart';

class MainModule implements Module{
  @override
  String name = 'Main';

  @override
  pages() {
    return [
            Page(title: 'User Detail', route: UserRoutes.userDetail),
            Page(title: 'User Form', route: UserRoutes.userForm),
            Page(title: 'User List', route: UserRoutes.userList, showInDrawer: true, showInHome: true)
    ];
  }

  @override
  services(){
    getIt.registerFactory<NavigationServices>(() => NavigationServices());
    getIt.registerFactory<SharedPrefServices>(() => SharedPrefServices());
    getIt.registerFactory<ThemeServices>(() => ThemeServices());
    getIt.registerFactory<RestDioServices>(() => RestDioServices());
    getIt.registerFactory<RestHttpServices>(() => RestHttpServices());
    getIt.registerFactory<UserServices>(() => UserServices());
  }

  @override
  providers() {
    return [
      
    ];
  }

  @override
  void routes() {
    getIt<Routes>().addRoutes(AppsRoutes.routes);
    getIt<Routes>().addRoutes(UserRoutes.routes);
  }

}