import 'package:finance_guru/model/financial_data_model.dart';

final AssetModel testAsset0 = AssetModel(value: 100, title: 'Money in the Bank');
final AssetModel testAsset1 = AssetModel(value: 125, title: 'Cash', uuid: "2");
final AssetModel testAsset2 = AssetModel(value: 22, title: 'Starbucks Gift Card');

final DebtModel testDebt0 = DebtModel(value: 25, title: 'Credit Card Debt');

final mockAssetModelList = [testAsset0];
final mockDebtModelList = [testDebt0];

final fakeAssetModelList = [testAsset1, testAsset2];

final AssetModel testAsset3 = AssetModel(value: 200, title: 'Money in the Bank');
final AssetModel testAsset4 = AssetModel(value: 700, title: 'Tesla Stock');
final AssetModel testAsset5 = AssetModel(value: 150, title: 'Index Fund stock');
final fakeAssetModelList2 = [testAsset3, testAsset4, testAsset5];


final DebtModel testDebt1 = DebtModel(value: 101, title: 'Visa');
final DebtModel testDebt2 = DebtModel(value: 51, title: 'Mastercard');
final DebtModel testDebt3 = DebtModel(value: 23, title: 'Amex');
final DebtModel testDebt4 = DebtModel(value: 25, title: 'Credit Card Debt');
final fakeDebtModelList2 = [testDebt1, testDebt2, testDebt3, testDebt4];