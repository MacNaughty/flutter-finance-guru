import '../../model/financial_data_model.dart';

abstract class IFinancialDao {

  Future<List<AssetModel>> fetchAssetModelList();
  Future<void> addItemToAssetModelList(AssetModel assetModel);
  Future<void> removeAssetModelFromListByIndex(int i);
  Future<void> deleteAllAssetModels(String tableName);

  Future<List<DebtModel>> fetchDebtModelList();
  Future<void> addItemToDebtModelList(DebtModel debtModel);
  Future<void> removeDebtModelFromListByIndex(int i);


}