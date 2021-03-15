import 'package:equatable/equatable.dart';
import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter/widgets.dart';

class HomeViewModel with ChangeNotifier {
  late IFinDataRepository _financialDataRepository;

  late final AssetModelList _assetModelList;
  List<AssetModel> get assetModelList => _assetModelList.assets;

  late final DebtModelList _debtModelList;
  List<DebtModel> get debtModelList => _debtModelList.debts;

  final FinancialSummaryList _financialSummaryDataList = FinancialSummaryList();
  FinancialSummaryList get summaryFinancialModelList => _financialSummaryDataList;

  HomeViewModel({required IFinDataRepository financialDataRepository }) {
    _financialDataRepository = financialDataRepository;
    _assetModelList = AssetModelList(_financialDataRepository.assetModelList);
    _debtModelList = DebtModelList(_financialDataRepository.debtModelList);
  }

  Future<void> fetchAssetModelList() async {
    _assetModelList.assets.clear();
    _assetModelList.assets.addAll(await _financialDataRepository.fetchAssetModelList());
  }

  Future<void> addAssetModel(AssetModel assetModel) async {
    await _financialDataRepository.addAssetModelToList(assetModel);
  }

  Future<void> fetchDebtModelList() async {
    _debtModelList.debts.clear();
    _debtModelList.debts.addAll(await _financialDataRepository.fetchDebtModelList());
  }

  Future<void> removeAssetModelByIndex(int i) async {
    await _financialDataRepository.removeAssetModelByIndex(i);
  }

  void setSummaryModelList() {
    int sumPositiveBalances = assetModelList.map((e) => e.valueInCents).reduce((value, element) => value + element);
    int sumNegativeBalances = debtModelList.map((e) => e.valueInCents).reduce((value, element) => value + element);
    int netWorth = sumPositiveBalances - sumNegativeBalances;

    _financialSummaryDataList.summaryList.clear();
    _financialSummaryDataList.summaryList.addAll([
      FinancialDataModel(value: netWorth, title: 'Net Worth'),
      FinancialDataModel(value: sumPositiveBalances, title: 'Assets'),
      FinancialDataModel(value: sumNegativeBalances, title: 'Debt'),
    ]);
  }
}

class DebtModelList extends Equatable with ChangeNotifier {
  late final List<DebtModel> debts;

  DebtModelList(List<DebtModel> debts) {
    this.debts = debts;
  }

  @override
  List<Object?> get props => [debts];
}

class AssetModelList extends Equatable with ChangeNotifier {
  late final List<AssetModel> assets;

  AssetModelList(List<AssetModel> assets) {
    this.assets = assets;
  }

  @override
  List<Object?> get props => [assets];
}

class FinancialSummaryList extends Equatable with ChangeNotifier {
  late final List<FinancialDataModel> summaryList = [];

  FinancialSummaryList();

  FinancialSummaryList.fromDebtAssets({required List<DebtModel> debtList, required List<AssetModel> assetList}) {
    int sumPositiveBalances = assetList.map((e) => e.valueInCents).reduce((value, element) => value + element);
    int sumNegativeBalances = debtList.map((e) => e.valueInCents).reduce((value, element) => value + element);
    int netWorth = sumPositiveBalances - sumNegativeBalances;

    summaryList.clear();
    summaryList.addAll([
      FinancialDataModel(value: netWorth, title: 'Net Worth'),
      FinancialDataModel(value: sumPositiveBalances, title: 'Assets'),
      FinancialDataModel(value: sumNegativeBalances, title: 'Debt'),
    ]);
  }

  @override
  List<Object?> get props => [summaryList];
}