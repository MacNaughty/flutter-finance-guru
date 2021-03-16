import '../../model/financial_data_model.dart';

abstract class IFinancialDao {

  Future<List<AssetModel>> fetchAssetModelList();
  Future<void> addItemToAssetModelList(AssetModel assetModel);
  Future<void> removeAssetModelById(String id);
  Future<void> deleteAllAssetModels(String tableName);

  Future<List<DebtModel>> fetchDebtModelList();
  Future<void> addItemToDebtModelList(DebtModel debtModel);
  Future<void> removeDebtModelById(String id);


}