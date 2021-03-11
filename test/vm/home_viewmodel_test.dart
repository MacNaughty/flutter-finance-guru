import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'home_viewmodel_test.mocks.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/data/financial_data_repository.dart';

class FakeFinancialDataRepository extends Fake implements IFinDataRepository {

  List<AssetModel> _assetModelList = [];
  @override
  List<AssetModel> get assetModelList => _assetModelList;

  @override
  Future<void> addAssetModelToList(AssetModel assetModel) async {
    _assetModelList.add(assetModel);
  }

  @override
  Future<void> removeAssetModelByIndex(int i) async {
    _assetModelList.removeAt(i);
  }
}

@GenerateMocks([FinancialDataRepository])
void main() {

  group('fetch assetModelList, debtModelList and summary/netModelList', () {
    final mockAssetModelList = [AssetModel(value: 100, title: 'Money in the Bank', uuid: 1)];
    final mockDebtModelList = [DebtModel(value: 50, title: 'Credit Card Debt', uuid: 2)];
    MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
    when(mockFinancialDataRepository.assetModelList).thenAnswer((_) => mockAssetModelList);
    when(mockFinancialDataRepository.fetchAssetModelList()).thenAnswer((_) async => Future.value(mockAssetModelList));

    when(mockFinancialDataRepository.debtModelList).thenAnswer((_) => mockDebtModelList);
    when(mockFinancialDataRepository.fetchDebtModelList()).thenAnswer((_) async => Future.value(mockDebtModelList));
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);

    test('fetch and set assetModelList from the repository', () async {

      expect(homeViewModel.assetModelList, mockAssetModelList);

      await homeViewModel.fetchAssetModelList();

      expect(homeViewModel.assetModelList, mockAssetModelList);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList[0].value, 100);
      expect(homeViewModel.assetModelList[0].title, 'Money in the Bank');
      expect(homeViewModel.assetModelList[0].uuid, 1);
      verify(mockFinancialDataRepository.fetchAssetModelList());
    });

    test('fetch and set debtModelList from the repository', () async {

      expect(homeViewModel.debtModelList, []);

      await homeViewModel.fetchDebtModelList();

      expect(homeViewModel.debtModelList, mockDebtModelList);
      verify(mockFinancialDataRepository.fetchDebtModelList());
    });
  });

  group('update items from asset & debt modelLists', () {
    AssetModel testAsset1 = AssetModel(value: 125, title: 'Bricks', uuid: 3);
    AssetModel testAsset2 = AssetModel(value: 99, title: 'Concrete', uuid: 3);

    FakeFinancialDataRepository fakeFinancialDataRepository = FakeFinancialDataRepository();
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: fakeFinancialDataRepository);

    test('test refresh assetModelList from repository', () async {
      expect(homeViewModel.assetModelList, []);

      fakeFinancialDataRepository.assetModelList.add(testAsset1);

      expect(homeViewModel.assetModelList, fakeFinancialDataRepository.assetModelList);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList[0].value, 125);
      expect(homeViewModel.assetModelList[0].title, 'Bricks');
      expect(homeViewModel.assetModelList[0].uuid, 3);
      fakeFinancialDataRepository._assetModelList.clear();
    });

    test('test refresh assetModelList from repository', () async {

      expect(homeViewModel.assetModelList, []);

      fakeFinancialDataRepository.assetModelList.add(testAsset1);

      expect(homeViewModel.assetModelList, fakeFinancialDataRepository._assetModelList);
      expect(homeViewModel.assetModelList, [testAsset1]);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList[0].value, 125);
      expect(homeViewModel.assetModelList[0].title, 'Bricks');
      expect(homeViewModel.assetModelList[0].uuid, 3);
      fakeFinancialDataRepository._assetModelList.clear();
    });


    test('add positive asset model to list in repository', () async {

      expect(homeViewModel.assetModelList, []);

      await homeViewModel.addAssetModel(testAsset1);

      expect(homeViewModel.assetModelList, [testAsset1]);
      fakeFinancialDataRepository._assetModelList.clear();

    });

    test('remove positive asset model to list in repository', () async {

      expect(homeViewModel.assetModelList, []);
      await homeViewModel.addAssetModel(testAsset1);
      await homeViewModel.addAssetModel(testAsset2);

      await homeViewModel.removeAssetModelByIndex(0);

      expect(fakeFinancialDataRepository._assetModelList, [testAsset2]);
      expect(homeViewModel.assetModelList, [testAsset2]);

    });
  });
}