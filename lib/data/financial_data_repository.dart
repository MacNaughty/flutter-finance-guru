import 'package:finance_guru/model/financial_data_model.dart';
import '../model/financial_data_model.dart';
import 'i_findata_repo.dart';
import 'package:flutter/widgets.dart';

import 'source/financial_database_dao.dart';
import 'source/i_findata_dao.dart';

// This repository will be the single source of truth for home viewmodel
class FinancialDataRepository implements IFinDataRepository {
  late IFinDataDao finDataDao;

  FinancialDataRepository({required IFinDataDao dao}) {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    finDataDao = dao;
  }

  @override
  List<AssetModel> assetModelList = [];

  @override
  Future<List<AssetModel>> fetchAssetModelList() async {
    assetModelList = await finDataDao.fetchAssetModelList();

    return assetModelList;
  }
}
