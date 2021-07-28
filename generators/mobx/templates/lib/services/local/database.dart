import 'dart:async';

import 'package:<%= appsName %>/utils/encryption/xxtea.dart';

import 'local_db_constants.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';

class LocalDatabase {
  // Singleton instance
  static final LocalDatabase _singleton = LocalDatabase._();

  // Singleton accessor
  static LocalDatabase get db => _singleton;

  // Completer is used for transforming synchronous code into asynchronous code.
  Completer<Database>? _dbOpenCompleter;

  // Key for encryption
  var encryptionKey = "coba";

  // A private constructor. Allows us to create instances of LocalDatabase
  // only from within the LocalDatabase class itself.
  LocalDatabase._();

  // Database object accessor
  Future<Database> get database async {
    // If completer is null, LocalDatabaseClass is newly instantiated, so database is not yet opened
    if (_dbOpenCompleter == null) {
      _dbOpenCompleter = Completer();

      // Calling _openDatabase will also complete the completer with database instance
      _openDatabase();
    }
    // If the database is already opened, awaiting the future will happen instantly.
    // Otherwise, awaiting the returned future will take some time - until complete() is called
    // on the Completer in _openDatabase() below.
    return _dbOpenCompleter!.future;
  }

  Future _openDatabase() async {
    // Get a platform-specific directory where persistent app data can be stored
    final appDocumentDir = await getApplicationDocumentsDirectory();

    // Path with the form: /platform-specific-directory/demo.db
    final dbPath = join(appDocumentDir.path, DBConstants.DB_NAME);

    // Check to see if encryption is set, then provide codec
    // else init normal db with path
    var database;
    if (encryptionKey.isNotEmpty) {
      // Initialize the encryption codec with a user password
      var codec = getXXTeaCodec(password: encryptionKey);

      // var codec = getEncryptSembastCodec(password: encryptionKey);

      database = await databaseFactoryIo.openDatabase(dbPath, codec: codec);

      database = await databaseFactoryIo.openDatabase(dbPath);
    } else {
      database = await databaseFactoryIo.openDatabase(dbPath);
    }

    // Any code awaiting the Completer's future will now start executing
    _dbOpenCompleter!.complete(database);
  }
}
