import '../model/financial_data_model.dart';

abstract class IFinDataRepository {

  List<AssetModel> get assetModelList;
  Future<List<AssetModel>> fetchAssetModelList();

  List<DebtModel> get debtModelList;
  Future<List<DebtModel>> fetchDebtModelList();

  Future<void> addAssetModelToList(AssetModel assetModel);

  Future<void> removeAssetModelByIndex(int i);

}