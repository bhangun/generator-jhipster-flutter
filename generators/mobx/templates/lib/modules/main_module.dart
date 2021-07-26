import 'package:kutilang_example/store/auth_store/auth_store.dart';
import 'package:provider/provider.dart';
import '../services/apps_routes.dart';
import '../store/app_store/app_store.dart';
import '../utils/modules/module.dart';
import 'account/services/user_routes.dart';

class MainModule implements Module {
  @override
  String? name = 'Main';

  @override
  pages() => [
        Page(title: 'User Detail', route: UserRoutes.userDetail),
        Page(title: 'User Form', route: UserRoutes.userForm),
        Page(
            title: 'User List',
            route: UserRoutes.userList,
            showInDrawer: true,
            showInHome: true)
      ];

  @override
  services() {}

  @override
  providers() => [
        Provider<AppStore>(
          create: (_) => AppStore(),
          dispose: (_, store) => store.dispose(),
        ),
         Provider<AuthStore>(
          create: (_) => AuthStore(),
          dispose: (_, store) => store.dispose(),
        ),
      ];

  @override
  routes() => [AppsRoutes.routes, UserRoutes.routes];
}
