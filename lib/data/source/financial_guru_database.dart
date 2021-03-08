import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';


class FinGuruDatabase {
  FinGuruDatabase._();
  static final FinGuruDatabase instance = FinGuruDatabase._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database;
  }

  Future<Database?> initDB() async {
    String? databasesPath = await getDatabasesPath();
    if (databasesPath == null) {
      return null;
    } else {
      return await openDatabase(
          join((databasesPath), 'finance_guru.db'),
          onCreate: (db, version) async {
            await db.execute("CREATE TABLE positive_assets("
                "uuid INTEGER PRIMARY KEY, value INTEGER, title TEXT, desc TEXT, interestRate REAL"
            );
          },
          version: 1
      );
    }
  }

}