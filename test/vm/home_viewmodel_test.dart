import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../commons/dummy_financial_data.dart';
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

    MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
    when(mockFinancialDataRepository.assetModelList).thenAnswer((_) => []);
    when(mockFinancialDataRepository.fetchAssetModelList()).thenAnswer((_) async => Future.value(mockAssetModelList));

    when(mockFinancialDataRepository.debtModelList).thenAnswer((_) => []);
    when(mockFinancialDataRepository.fetchDebtModelList()).thenAnswer((_) async => Future.value(mockDebtModelList));
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);

    test('fetch assetModelList from the repository', () async {

      expect(homeViewModel.assetModelList, []);

      await homeViewModel.fetchAssetModelList();

      expect(homeViewModel.assetModelList, mockAssetModelList);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList[0].value, 100);
      expect(homeViewModel.assetModelList[0].title, 'Money in the Bank');
      // expect(homeViewModel.assetModelList[0].uuid, "1");
      verify(mockFinancialDataRepository.fetchAssetModelList());
    });

    test('fetch debtModelList from the repository', () async {

      expect(homeViewModel.debtModelList, []);

      await homeViewModel.fetchDebtModelList();

      expect(homeViewModel.debtModelList, mockDebtModelList);
      verify(mockFinancialDataRepository.fetchDebtModelList());
    });

    test('fetch summaryModelList from the repository', () async {

      expect(homeViewModel.summaryFinancialModelList, []);
      expect(homeViewModel.assetModelList, mockAssetModelList);
      expect(homeViewModel.debtModelList, mockDebtModelList);
      homeViewModel.setSummaryModelList();

      expect(homeViewModel.summaryFinancialModelList, [
        FinancialDataModel(value: 75, title: 'Net Worth'),
        FinancialDataModel(value: 100, title: 'Assets'),
        FinancialDataModel(value: 25, title: 'Debt'),
      ]);
      verify(mockFinancialDataRepository.fetchDebtModelList());
    });
  });




  group('update items from asset & debt modelLists', () {

    FakeFinancialDataRepository fakeFinancialDataRepository = FakeFinancialDataRepository();
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: fakeFinancialDataRepository);

    test('test refresh assetModelList from repository', () async {
      expect(homeViewModel.assetModelList, []);

      fakeFinancialDataRepository.assetModelList.add(testAsset1);

      expect(homeViewModel.assetModelList, fakeFinancialDataRepository.assetModelList);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList, [testAsset1]);
      expect(homeViewModel.assetModelList[0].value, testAsset1.value);
      expect(homeViewModel.assetModelList[0].title, testAsset1.title);
      expect(homeViewModel.assetModelList[0].uuid, testAsset1.uuid);
      fakeFinancialDataRepository._assetModelList.clear();
    });

    test('test refresh assetModelList from repository', () async {

      expect(homeViewModel.assetModelList, []);

      fakeFinancialDataRepository.assetModelList.add(testAsset1);

      expect(homeViewModel.assetModelList, fakeFinancialDataRepository._assetModelList);
      expect(fakeFinancialDataRepository.assetModelList, fakeFinancialDataRepository._assetModelList);
      expect(homeViewModel.assetModelList, [testAsset1]);
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

      expect(homeViewModel.assetModelList, [testAsset2]);

    });
  });
}