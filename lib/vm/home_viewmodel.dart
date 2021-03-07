import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {
  late IFinDataRepository _financialDataRepository;

  List<AssetModel> assetList = [];

  HomeViewModel({required IFinDataRepository financialDataRepository }) {
    _financialDataRepository = financialDataRepository;
  }

  Future<void> getAssetModelList() async {
    assetList = await _financialDataRepository.fetchAssetModelList();
  }

}