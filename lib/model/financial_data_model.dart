class FinancialDataModel {
  late String title;
  late int value;

  String? description;
  double? interestRate;

  FinancialDataModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    title = json['title'];
    description = json['description'];
    interestRate = json['interestRate'];
  }

  FinancialDataModel({required int value, required String title, description, interestRate, type}) {
    this.value = value;
    this.title = title;
    this.description = description;
    this.interestRate = interestRate;
  }
}

abstract class DebtAssetModel extends FinancialDataModel {
  late final String uuid;

  DebtAssetModel(
      {required int value, required String title, required String uuid, String? description, String? interestRate})
      :
        uuid = uuid,
        super(title: title, value: value, description: description, interestRate: interestRate);
}

class AssetModel extends DebtAssetModel {
  AssetModel({required int value, required String title, required String uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);
}

class DebtModel extends DebtAssetModel {
  DebtModel({required int value, required String title, required String uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);
}
