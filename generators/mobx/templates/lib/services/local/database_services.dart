//import 'package:f_logs/f_logs.dart';
import 'package:kutilang_example/models/app_data.dart';
import 'package:sembast/sembast.dart';

import 'database.dart';
import 'local_db_constants.dart';

class DatabaseServices {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _appsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await LocalDatabase.db.database;

  // Singleton instance
  static final DatabaseServices _singleton = DatabaseServices._();

  // A private constructor. Allows us to create instances of DatabaseServices
  // only from within the DatabaseServices class itself.
  DatabaseServices._();

  // Singleton accessor
  static DatabaseServices get db => _singleton;

  token(String token) async {
    await _appsStore.record(0).add(await _db, {'id_token': token});
  }

  Future<int> deleteToken() async {
    final finder = Finder(filter: Filter.byKey(0));
    return (await _appsStore.delete(await _db, finder: finder));
  }

  Future<String> fetchToken() async {
    final finder = Finder(filter: Filter.byKey(0));
    Map<String, Object?> value = {'id_token': ''};
    String token = '';
    try {
      var v = (await _appsStore.find(await _db, finder: finder)).first;
      value = v.value;
      token = value['id_token'].toString();
    } catch (e) {
      //FLog.info(text: '++++++++++>' + value.toString());
    }
    return token;
  }

  // DB functions:--------------------------------------------------------------
  Future<int> insert(AppData appData) async {
    return await _appsStore.add(await _db, appData.toMap());
  }

  Future<Map<String, Object?>> fetch(String key) async {
    print('>>>>>>>>>'+key);
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(key));
    Map<String, Object?>? value ;
    print('?????????>'+finder.toString());
    try{
        value =(await _appsStore.findFirst(await _db, finder: finder))!.value;
        print('<><><><><><>'+value.toString());
    }catch(e){
      print(e.toString());
      value = {'id_token':''};
    }
    print('<><><2><><><>'+value.toString());
    return value;
  }

  Future<int> update(AppData appData) async {
    // For filtering by key (ID), RegEx, greater than, and many other criteria,
    // we use a Finder.
    final finder = Finder(filter: Filter.byKey(appData.id));
    return await _appsStore.update(
      await _db,
      appData.toMap(),
      finder: finder,
    );
  }

  Future<int> delete(AppData appData) async {
    final finder = Finder(filter: Filter.byKey(appData.id));
    return await _appsStore.delete(
      await _db,
      finder: finder,
    );
  }

  Future deleteAll() async {
    await _appsStore.drop(
      await _db,
    );
  }

  Future<List<AppData>> getAllSortedByFilter(
      {required List<Filter> filters}) async {
    //creating finder
    final finder = Finder(
        filter: Filter.and(filters),
        sortOrders: [SortOrder(DBConstants.FIELD_ID)]);

    final recordSnapshots = await _appsStore.find(
      await _db,
      finder: finder,
    );

    // Making a List<AppData> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final appData = AppData.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      appData.id = snapshot.key;
      return appData;
    }).toList();
  }

  Future<List<AppData>> getAllAppDatas() async {
    final recordSnapshots = await _appsStore.find(
      await _db,
    );

    // Making a List<AppData> out of List<RecordSnapshot>
    return recordSnapshots.map((snapshot) {
      final appData = AppData.fromMap(snapshot.value);
      // An ID is a key of a record from the database.
      appData.id = snapshot.key;
      return appData;
    }).toList();
  }
}

/* {
  store: "notes", 
  key: 2, 
  value: {title: "Welcome to NotePad kjbnkjnj", 
    content: "is the same in all tabs", 
    date: 1615207021001
    }
} */
