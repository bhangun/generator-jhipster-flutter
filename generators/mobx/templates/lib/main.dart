// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'services/apps_routes.dart';
import 'services/navigation.dart';
import 'services/preferences_service.dart';
import 'store/settings/settings_store.dart';
import 'utils/config.dart';
import 'utils/modules/modules_registry.dart';
import 'utils/routes.dart';

Future<void> main() async {
  // Initialized
  WidgetsFlutterBinding.ensureInitialized();

  final sharedPreferences = await SharedPreferences.getInstance();

  // Register all module
  ModulesRegistry.registry();

  // Observe mobx state change
  mainContext.spy(print);

  // Run main app
  runApp(KutilangApp(sharedPreferences));
}

class KutilangApp extends StatelessWidget {
  const KutilangApp(this.sharedPreferences);

  final SharedPreferences sharedPreferences;

  @override
  Widget build(BuildContext context) => MultiProvider(
          providers: [
            Provider<PreferencesService>(
              create: (_) => PreferencesService(sharedPreferences),
            ),
            ProxyProvider<PreferencesService, SettingsStore>(
                update: (_, preferencesService, __) =>
                    SettingsStore(preferencesService)),
            ...ModulesRegistry.providers()
          ],
          child: Consumer<SettingsStore>(
              builder: (_, store, __) => Observer(
                  key: Key('kutilang_app'),
                  builder: (_) => MaterialApp(
                        key: GlobalKey<NavigatorState>(),
                        theme: store.theme,
                        routes: RoutesService.routes,
                        initialRoute: AppsRoutes.splash,
                        navigatorKey: NavigationServices.navigatorKey,
                        debugShowCheckedModeBanner: false,
                        locale: store.locale,
                        localeResolutionCallback: (
                          Locale? _locale,
                          Iterable<Locale> supportedLocales,
                        ) =>
                            store.locale,
                        localizationsDelegates: [
                         AppLocalizations.delegate,
                          GlobalMaterialLocalizations.delegate,
                          GlobalWidgetsLocalizations.delegate,
                        ],
                        supportedLocales: locales,
                      ))));
}
