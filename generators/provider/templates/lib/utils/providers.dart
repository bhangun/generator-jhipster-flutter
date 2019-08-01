import 'package:provider/provider.dart';

class AppProviders {

   var _providers  = List<SingleChildCloneableWidget>();

  addProviders (SingleChildCloneableWidget newProvider){
    _providers.add(newProvider);
  }

  List<SingleChildCloneableWidget> get providers => _providers;
}
