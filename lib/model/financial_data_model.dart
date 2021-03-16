import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

class FinancialDataModel extends Equatable {
  late String title;
  late int valueInCents;

  String? description;
  String? interestRate;

  FinancialDataModel.fromJson(Map<String, dynamic> json) {
    valueInCents = json['value'];
    title = json['title'];
    description = json['desc'];
    interestRate = json['interestRate'];
  }

  FinancialDataModel({required int value, required String title, description, interestRate, type}) {
    this.valueInCents = value;
    this.title = title;
    this.description = description;
    this.interestRate = interestRate;
  }

  @override
  List<Object?> get props => [valueInCents, title, description, interestRate];
}

abstract class DebtAssetModel extends FinancialDataModel {
  late final String uuid;

  DebtAssetModel(
      {required int value, required String title, String? uuid, String? description, String? interestRate})
      :
        uuid = uuid == null ? Uuid().v1() : uuid,
        super(title: title, value: value, description: description, interestRate: interestRate);


  DebtAssetModel.fromJson(Map<String, dynamic> json) : super.fromJson(json) {
    uuid = json['uuid'];
  }
}

class AssetModel extends DebtAssetModel {

  AssetModel({required int value, required String title, String? uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);

  AssetModel.fromJson(Map<String, dynamic> json) : super.fromJson(json);

  Map<String, dynamic> toMap() {
    Map<String, dynamic> result = {};
    result['uuid'] = uuid;
    result['value'] = valueInCents;
    result['title'] = title;
    result['desc'] = description;
    result['interestRate'] = interestRate;
    return result;
  }


}

class DebtModel extends DebtAssetModel {
  DebtModel({required int value, required String title, String? uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);

  DebtModel.fromJson(Map<String, dynamic> json) : super.fromJson(json);
}
