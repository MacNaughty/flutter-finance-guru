import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:sqflite/sqflite.dart';

import 'financial_guru_database.dart';
import 'i_financial_dao.dart';

class FinancialDao extends IFinancialDao {

  late Database _database;
  FinancialDao({required Database database}) {
    _database = database;
  }

  @override
  Future<List<AssetModel>> fetchAssetModelList() async {
    final List<Map<String, dynamic>> rawAssetListData = await _database.query("positive_assets");
    return rawAssetListData.map((element) => AssetModel.fromJson(element)).toList();
  }

  @override
  Future<void> addItemToAssetModelList(AssetModel assetModel) async {
    Map<String, dynamic> assetMap = assetModel.toMap();
    await _database.insert("positive_assets", assetMap, conflictAlgorithm: ConflictAlgorithm.replace);
  }

  @override
  Future<void> removeAssetModelById(String id) async {
    await _database.delete("positive_assets", where: "uuid = ?", whereArgs: [id]);
  }

  @override
  Future<void> deleteAllAssetModels(String tableName) async {
    await _database.delete(tableName);
  }


  @override
  Future<List<DebtModel>> fetchDebtModelList() async {
    // TODO: implement fetchDebtModelList
    throw UnimplementedError();
  }

  @override
  Future<void> addItemToDebtModelList(DebtModel debtModel) async {
    // TODO: implement addItemToDebtModelList
    throw UnimplementedError();
  }

  @override
  Future<void> removeDebtModelById(String id) async {
    // TODO: implement removeDebtModelByIndexList
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllDebtModels(String tableName) async {
    await _database.delete(tableName);
  }



}