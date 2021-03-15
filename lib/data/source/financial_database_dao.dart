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
  Future<List<AssetModel>> fetchAssetModelList() async {
    // TODO: implement fetchAssetModelList
    throw UnimplementedError();
  }

  @override
  Future<void> addItemToAssetModelList(AssetModel assetModel) async {
    // TODO: implement addItemToAssetModelList
    throw UnimplementedError();
  }

  @override
  Future<void> addItemToDebtModelList(DebtModel debtModel) async {
    // TODO: implement addItemToDebtModelList
    throw UnimplementedError();
  }

  @override
  Future<List<DebtModel>> fetchDebtModelList() async {
    // TODO: implement fetchDebtModelList
    throw UnimplementedError();
  }

  @override
  Future<void> removeAssetModelFromListByIndex(int i) async {
    // TODO: implement removeAssetModelByIndexList
    throw UnimplementedError();
  }

  @override
  Future<void> removeDebtModelFromListByIndex(int i) async {
    // TODO: implement removeDebtModelByIndexList
    throw UnimplementedError();
  }



}