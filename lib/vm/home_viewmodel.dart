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
    _assetModelList = _financialDataRepository.assetModelList;
  }

  Future<void> fetchAssetModelList() async {
    _assetModelList = await _financialDataRepository.fetchAssetModelList();
  }

  Future<void> addAssetModel(AssetModel assetModel) async {
    await _financialDataRepository.addAssetModelToList(assetModel);
  }

  Future<void> fetchDebtModelList() async {
    _debtModelList = await _financialDataRepository.fetchDebtModelList();
  }

  Future<void> removeAssetModelByIndex(int i) async {
    await _financialDataRepository.removeAssetModelByIndex(i);
  }

}