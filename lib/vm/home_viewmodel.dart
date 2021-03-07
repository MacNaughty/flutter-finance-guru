import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {
  late IFinDataRepository financialDataRepository;

  List<AssetModel>? assetList;

  HomeViewModel({required IFinDataRepository financialDataRepository }) {
    financialDataRepository = financialDataRepository;
  }

  Future<void> getAssetModelList() {
    // TODO: implement getAssetModelList
    throw UnimplementedError();
  }

}