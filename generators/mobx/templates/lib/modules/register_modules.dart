import 'package:<%= appsName %>/models/module.dart';
import 'package:<%= appsName %>/modules/main_module.dart';
// kutilang-needle-import-module -- don't remove this line

List<Module> registerModules(){
  return [
    MainModule(),
    // kutilang-needle-add-module -- don't remove this line
  ];
}