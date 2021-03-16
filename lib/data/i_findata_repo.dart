import '../model/financial_data_model.dart';

abstract class IFinDataRepository {

  List<AssetModel> get assetModelList;
  Future<List<AssetModel>> fetchAssetModelList();

  List<DebtModel> get debtModelList;
  Future<List<DebtModel>> fetchDebtModelList();

  Future<void> addAssetModelToList(AssetModel assetModel);
  Future<void> removeAssetModelById(String id);


  Future<void> addDebtModelToList(DebtModel debtModel);
  Future<void> removeDebtModelById(String id);

}