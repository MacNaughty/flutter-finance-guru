import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {
  late IFinDataRepository _financialDataRepository;

  List<AssetModel> _assetModelList = [];
  List<AssetModel> get assetModelList => _assetModelList;
  List<DebtModel> _debtModelList = [];
  List<DebtModel> get debtModelList => _debtModelList;

  HomeViewModel({required IFinDataRepository financialDataRepository }) {
    _financialDataRepository = financialDataRepository;
  }

  Future<void> fetchAssetModelList() async {
    _assetModelList = await _financialDataRepository.fetchAssetModelList();
  }

  Future<void> fetchDebtModelList() async {
    _debtModelList = await _financialDataRepository.fetchDebtModelList();
  }

  Future<void> addAssetModelToList(AssetModel testAsset) async {
    throw UnimplementedError('Finish method when test case is done');
  }

}