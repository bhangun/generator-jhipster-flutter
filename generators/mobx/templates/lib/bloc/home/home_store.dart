
import '../../bloc/error/error_store.dart';
import 'package:mobx/mobx.dart';

part 'home_store.g.dart';

class HomeStore = _HomeStore with _$HomeStore;

abstract class _HomeStore implements Store {

  // store for handling errors
  final ErrorStore errorStore = ErrorStore();

  // store variables:-----------------------------------------------------------

  @observable
  String title='';

  @observable
  bool loading = false;

  // actions:-------------------------------------------------------------------

  
}