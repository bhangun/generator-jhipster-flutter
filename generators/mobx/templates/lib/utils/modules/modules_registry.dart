import 'package:<%= appsName %>/modules/register_modules.dart';
import 'package:logging/logging.dart';
import 'package:provider/single_child_widget.dart';

import '../routes.dart';
import 'modules.dart';

class ModulesRegistry {
  final log = Logger('AuthBloc');
  // singleton object
  static final ModulesRegistry _singleton = ModulesRegistry._();

  // factory method to return the same object each time its needed
  factory ModulesRegistry() =>  _singleton;

  static late List<SingleChildWidget> _providerList =[];

  ModulesRegistry._(){
    //_registry();
  }
 
  static registry(){
    registerModules().forEach((m){
        m.pages().forEach((p){
          p.name = m.name;
          Modules.addPages(p);
        });

        m.providers().forEach((e) {
          _providerList.add(e);
        });
    
        m.routes().forEach((r) {
          RoutesService.addRoutes(r);
        });
        m.services();
    });
  }

  static List<SingleChildWidget> providers(){
    return _providerList;
  }

}



