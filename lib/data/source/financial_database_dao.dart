import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:sqflite/sqflite.dart';

import 'financial_guru_database.dart';
import 'i_findata_dao.dart';

class FinancialDatabaseDao extends IFinDataDao {

  late Database _database;
  FinancialDatabaseDao({required Database database}) {
    _database = database;
  }

  @override
  Future<List<AssetModel>> fetchAssetModelList() {

    throw UnimplementedError();
  }



}