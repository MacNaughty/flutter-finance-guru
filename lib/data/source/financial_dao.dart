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