import 'package:<%= appsName %>/utils/db_constants.dart';
import 'package:sembast/sembast.dart';
import '../../models/app_data.dart';
import 'app_database.dart';


class AppDataSource {
  // A Store with int keys and Map<String, dynamic> values.
  // This Store acts like a persistent map, values of which are Flogs objects converted to Map
  final _appsStore = intMapStoreFactory.store(DBConstants.STORE_NAME);

  // Private getter to shorten the amount of code needed to get the
  // singleton instance of an opened database.
  Future<Database> get _db async => await AppDatabase.instance.database;

  // Singleton instance
  static final AppDataSource _singleton = AppDataSource._();

  // A private constructor. Allows us to create instances of AppDataSource
  // only from within the AppDataSource class itself.
  AppDataSource._();

  // Singleton accessor
  static AppDataSource get instance => _singleton;

  // DB functions:--------------------------------------------------------------
  Future<int> insert(AppData appData) async {
    return await _appsStore.add(await _db, appData.toMap());
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

  Future<List<AppData>> getAllSortedByFilter({List<Filter> filters}) async {
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