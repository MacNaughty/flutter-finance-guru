import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class FinGuruDatabase {
  FinGuruDatabase._();
  static final FinGuruDatabase dao = FinGuruDatabase._();
  static late Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }

    _database = await initDB();
    return _database;
  }

  initDB() async {
    return await openDatabase(
        join((await getDatabasesPath())!, 'finance_guru.db'),
        onCreate: (db, version) async {
          await db.execute("CREATE TABLE positive_assets("
              "uuid INTEGER PRIMARY KEY, value INTEGER, title TEXT, desc TEXT, interestRate REAL"
          );
        },
        version: 1
    );
  }

}