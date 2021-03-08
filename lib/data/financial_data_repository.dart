import 'package:finance_guru/model/financial_data_model.dart';
import '../model/financial_data_model.dart';
import 'i_findata_repo.dart';
import 'package:flutter/widgets.dart';

import 'source/financial_database_dao.dart';

class FinancialDataRepository implements IFinDataRepository {

  late FinancialDatabaseDao finDataDao;
  FinancialDataRepository._privateConstructor() {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    finDataDao = FinancialDatabaseDao();
  }

  static final FinancialDataRepository _instance = FinancialDataRepository._privateConstructor();

  static FinancialDataRepository get instance => _instance;


  @override
  List<AssetModel> assetModelList = [];

  @override
  Future<List<AssetModel>> fetchAssetModelList() {
    // TODO: implement fetchAssetModelList
    throw UnimplementedError();
  }




}