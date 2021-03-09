import '../../model/financial_data_model.dart';

abstract class IFinDataDao {

  Future<List<AssetModel>> fetchAssetModelList();

  Future<void> addItemToAssetModelList(AssetModel assetModel);

}