import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class FinGuruDatabase {

  Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database> initDB() async {
    late String databasesPath;
    String? factoryDatabasesPath = await getDatabasesPath();
    if (factoryDatabasesPath == null) {
      // TODO: make path in case getDatabasesPath() returns null
      // From getDatabasesPath() source code:
      // On Android, it is typically data/data/<package_name>/databases
      //
      // On iOS, it is the Documents directory
      databasesPath = 'defaultDatabasePath';
    } else {
      databasesPath = factoryDatabasesPath;
    }
    return await openDatabase(
        join((databasesPath), 'finance_guru.db'),
        onCreate: (db, version) async {
          await db.execute(
              "CREATE TABLE positive_assets(uuid INTEGER PRIMARY KEY, value INTEGER, title TEXT, desc TEXT, interestRate REAL)"
          );
        },
        version: 1
    );
  }


}