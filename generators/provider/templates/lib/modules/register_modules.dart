import 'package:<%= appsName %>/models/module.dart';
import 'package:<%= appsName %>/modules/main_module.dart';

import 'owner/owner_module.dart';

List<Module> registerModules(){
  return [
    MainModule(),
    OwnerModule(),
  ];
}