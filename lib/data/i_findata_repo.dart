import '../model/financial_data_model.dart';

abstract class IFinDataRepository {

  Future<List<AssetModel>> fetchAssetModelList();

}