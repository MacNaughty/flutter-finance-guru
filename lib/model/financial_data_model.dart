import 'package:equatable/equatable.dart';


class FinancialDataModel extends Equatable {
  late String title;
  late int value;
  late final int uuid;
  String? description;
  double? interestRate;

  FinancialDataModel.fromJson(Map<String, dynamic> json) {
    value = json['value'];
    title = json['title'];
    description = json['description'];
    interestRate = json['interestRate'];
    uuid = json['uuid'];
  }

  FinancialDataModel(
      {required int value, required String title, required int uuid, description, interestRate, type}) {
    this.value = value;
    this.title = title;
    this.description = description;
    this.interestRate = interestRate;
    this.uuid = uuid;
  }

  @override
  List<Object> get props => [uuid];
}

class AssetModel extends FinancialDataModel {
  AssetModel({required int value, required String title, required int uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);
}

class DebtModel extends FinancialDataModel {
  DebtModel({required int value, required String title, required int uuid, description, interestRate, type})
      : super(value: value, title: title, uuid: uuid, description: description, interestRate: interestRate);
}
