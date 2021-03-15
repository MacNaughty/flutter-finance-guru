import 'package:finance_guru/data/source/financial_guru_database.dart';
import 'package:finance_guru/data/source/i_financial_dao.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter/widgets.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';

import 'package:finance_guru/data/source/financial_dao.dart';
import 'package:finance_guru/data/financial_data_repository.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:test/test.dart';
import '../../commons/dummy_financial_data.dart';

class FakeFinancialDatabase extends Fake implements FinGuruDatabase {
  Database? _database;

  @override
  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    }

    _database = await initDB();
    return _database!;
  }

  @override
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
    return await openDatabase(join((databasesPath), 'finance_guru_test.db'), onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE positive_assets(uuid TEXT PRIMARY KEY, value INTEGER, title TEXT, desc TEXT, interestRate REAL)");
    }, version: 1);
  }
}

@GenerateMocks([FinancialDao])
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Database database = await FakeFinancialDatabase().database;
  FinancialDao financialDao = FinancialDao(database: database);

  group('fetch assetModelList and debtModelList from database', () {

    setUp(() {

    });

    tearDown(() {
      financialDao.deleteAllAssetModels('positive_assets');
    });

    test('fetch existing assets from database', () async {
      List<AssetModel> assetModelList = await financialDao.fetchAssetModelList();
      expect(assetModelList, []);
    });

    test('add asset model to database', () async {
      List<AssetModel> assetModelList = await financialDao.fetchAssetModelList();
      expect(assetModelList, []);
      await financialDao.addItemToAssetModelList(testAsset0);

      assetModelList = await financialDao.fetchAssetModelList();
      expect(assetModelList, [testAsset0]);
    });
  });
}
