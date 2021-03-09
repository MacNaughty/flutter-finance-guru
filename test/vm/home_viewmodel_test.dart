import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'home_viewmodel_test.mocks.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/data/financial_data_repository.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the Bank', uuid: 1)];
final dummyNegativeModelList = [DebtModel(value: 50, title: 'Credit Card Debt', uuid: 2)];

class FakeFinancialDataRepository extends Fake implements FinancialDataRepository {

  List<AssetModel> assetModelList = [];

  @override
  Future<void> addItemToAssetModelList(AssetModel assetModel) async {
    assetModelList.add(assetModel);
  }
}

@GenerateMocks([FinancialDataRepository])
void main() {

  group('fetch assetModelList, debtModelList and summary/netModelList', () {
    MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);
    test('fetch and set assetModelList from the repository', () async {
      when(mockFinancialDataRepository.fetchAssetModelList()).thenAnswer((_) async => dummyPositiveModelList);

      expect(homeViewModel.assetModelList, []);

      await homeViewModel.fetchAssetModelList();

      expect(homeViewModel.assetModelList, dummyPositiveModelList);
      expect(homeViewModel.assetModelList.length, 1);
      expect(homeViewModel.assetModelList[0].value, 100);
      expect(homeViewModel.assetModelList[0].title, 'Money in the Bank');
      expect(homeViewModel.assetModelList[0].uuid, 1);
      verify(mockFinancialDataRepository.fetchAssetModelList());
      verifyNoMoreInteractions(mockFinancialDataRepository);
    });

    test('fetch and set debtModelList from the repository', () async {
      when(mockFinancialDataRepository.fetchDebtModelList()).thenAnswer((_) async => dummyNegativeModelList);

      expect(homeViewModel.debtModelList, []);

      await homeViewModel.fetchDebtModelList();

      expect(homeViewModel.debtModelList, dummyNegativeModelList);
      verify(mockFinancialDataRepository.fetchDebtModelList());
      verifyNoMoreInteractions(mockFinancialDataRepository);
    });
  });

  group('update or delete items from asset/debt modelLists', () {
    FakeFinancialDataRepository fakeFinancialDataRepository = FakeFinancialDataRepository();
    HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: fakeFinancialDataRepository);
    test('add positive asset model to list in repository', () async {

      expect(homeViewModel.assetModelList, []);

      AssetModel testAsset = AssetModel(value: 125, title: 'Bricks', uuid: 3);
      await homeViewModel.addAssetModelToList(testAsset);

      expect(homeViewModel.assetModelList, [testAsset]);
      verify(fakeFinancialDataRepository.fetchDebtModelList());
      verifyNoMoreInteractions(fakeFinancialDataRepository);


    });

  });
}
