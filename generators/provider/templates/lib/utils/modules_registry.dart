import 'package:<%= appsName %>/modules/register_modules.dart';
import 'package:<%= appsName %>/services/getIt.dart';
import 'package:<%= appsName %>/utils/providers.dart';
import 'package:<%= appsName %>/utils/routes.dart';

import 'modules.dart';

class ModulesRegistry {
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  ModulesRegistry._(){
    getIt.registerSingleton(Modules());
    getIt.registerSingleton(Routes());
    getIt.registerSingleton(AppProviders());
    _registry();
  }

  _registry(){
    registerModules().forEach((m){
        m.pages().forEach((p){
          p.name = m.name;
          getIt<Modules>().addPages(p);
        });

        m.providers().forEach((p){
          getIt<AppProviders>().addProviders(p);
        });

        m.routes();
        m.services();
    });
  }
}