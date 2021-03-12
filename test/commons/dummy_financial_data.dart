import 'package:finance_guru/model/financial_data_model.dart';

final AssetModel testAsset0 = AssetModel(value: 100, title: 'Money in the Bank', uuid: "1");
final AssetModel testAsset1 = AssetModel(value: 125, title: 'Bricks', uuid: "2");
final AssetModel testAsset2 = AssetModel(value: 99, title: 'Concrete', uuid: "3");

final DebtModel testDebt0 = DebtModel(value: 25, title: 'Credit Card Debt', uuid: "1");

final mockAssetModelList = [testAsset0];
final mockDebtModelList = [testDebt0];

final fakeAssetModelList = [testAsset1, testAsset2];