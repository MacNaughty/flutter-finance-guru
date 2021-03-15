import 'package:finance_guru/model/financial_data_model.dart';

// TODO: more realistic UUIDs (when function gets implemented)
final AssetModel testAsset0 = AssetModel(value: 100, title: 'Money in the Bank', uuid: "1");
final AssetModel testAsset1 = AssetModel(value: 125, title: 'Cash', uuid: "2");
final AssetModel testAsset2 = AssetModel(value: 22, title: 'Starbucks Gift Card', uuid: "3");

final DebtModel testDebt0 = DebtModel(value: 25, title: 'Credit Card Debt', uuid: "1");

final mockAssetModelList = [testAsset0];
final mockDebtModelList = [testDebt0];

final fakeAssetModelList = [testAsset1, testAsset2];


final AssetModel testAsset3 = AssetModel(value: 200, title: 'Money in the Bank', uuid: "4");
final AssetModel testAsset4 = AssetModel(value: 700, title: 'Tesla Stock', uuid: "5");
final AssetModel testAsset5 = AssetModel(value: 150, title: 'Index Fund stock', uuid: "6");
final fakeAssetModelList2 = [testAsset3, testAsset4, testAsset5];


final DebtModel testDebt3 = DebtModel(value: 101, title: 'Visa', uuid: "2");
final DebtModel testDebt4 = DebtModel(value: 51, title: 'Mastercard', uuid: "3");
final DebtModel testDebt5 = DebtModel(value: 23, title: 'Amex', uuid: "4");
final DebtModel testDebt6 = DebtModel(value: 25, title: 'Credit Card Debt', uuid: "5");
final fakeDebtModelList2 = [testDebt3, testDebt4, testDebt5, testDebt6];