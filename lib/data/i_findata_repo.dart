import '../model/financial_data_model.dart';

abstract class IFinDataRepository {

  List<AssetModel> assetModelList = [];

  Future<List<AssetModel>> fetchAssetModelList();

}