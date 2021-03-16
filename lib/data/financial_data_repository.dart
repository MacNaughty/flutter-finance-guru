import 'package:finance_guru/model/financial_data_model.dart';
import '../model/financial_data_model.dart';
import 'i_findata_repo.dart';
import 'package:flutter/widgets.dart';

import 'source/financial_dao.dart';
import 'source/i_financial_dao.dart';

// This repository will be the single source of truth for home viewmodel
class FinancialDataRepository implements IFinDataRepository {
  late IFinancialDao finDataDao;

  FinancialDataRepository({required IFinancialDao dao}) {
    // Avoid errors caused by flutter upgrade.
    WidgetsFlutterBinding.ensureInitialized();
    finDataDao = dao;
  }

  List<AssetModel> _assetModelList = [];
  @override
  List<AssetModel> get assetModelList => _assetModelList;

  @override
  Future<List<AssetModel>> fetchAssetModelList() async {
    _assetModelList = await finDataDao.fetchAssetModelList();
    return assetModelList;
  }

  @override
  Future<void> addAssetModelToList(AssetModel assetModel) async {
    await finDataDao.addItemToAssetModelList(assetModel);
    fetchAssetModelList();
  }

  @override
  Future<void> removeAssetModelById(String id) async {
    await finDataDao.removeAssetModelById(id);
    fetchAssetModelList();
  }

  List<DebtModel> _debtModelList = [];
  @override
  List<DebtModel> get debtModelList => _debtModelList;


  @override
  Future<List<DebtModel>> fetchDebtModelList() async {
    _debtModelList = await finDataDao.fetchDebtModelList();
    return debtModelList;
  }

  @override
  Future<void> addDebtModelToList(DebtModel debtModel) async {
    await finDataDao.addItemToDebtModelList(debtModel);
    fetchDebtModelList();
  }

  @override
  Future<void> removeDebtModelById(String id) async {
    await finDataDao.removeDebtModelById(id);
    fetchDebtModelList();
  }

}
