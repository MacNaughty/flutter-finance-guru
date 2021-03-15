import '../../model/financial_data_model.dart';

abstract class IFinDataDao {

  Future<List<AssetModel>> fetchAssetModelList();
  Future<void> addItemToAssetModelList(AssetModel assetModel);
  Future<void> removeAssetModelFromListByIndex(int i);

  Future<List<DebtModel>> fetchDebtModelList();
  Future<void> addItemToDebtModelList(DebtModel debtModel);
  Future<void> removeDebtModelFromListByIndex(int i);


}