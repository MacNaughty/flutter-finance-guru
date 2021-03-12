import '../../model/financial_data_model.dart';

abstract class IFinDataDao {

  Future<List<AssetModel>> fetchAssetModelList();
  Future<void> addItemToAssetModelList(AssetModel assetModel);
  Future<void> removeAssetModelByIndexList(int i);

  Future<List<DebtModel>> fetchDebtModelList();
  Future<void> addItemToDebtModelList(DebtModel debtModel);
  Future<void> removeDebtModelByIndexList(int i);


}