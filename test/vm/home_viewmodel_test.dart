import 'package:mockito/annotations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'home_viewmodel_test.mocks.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/data/financial_data_repository.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the Bank', uuid: 1)];
final dummyNegativeModelList = [DebtModel(value: 100, title: 'Credit Card Debt', uuid: 1)];

@GenerateMocks([FinancialDataRepository])
void main() {
  MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
  HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);

  group('fetch assetModelList', () {
    test('fetch and set assetModelList from the repository', () async {
      when(mockFinancialDataRepository.fetchAssetModelList()).thenAnswer((_) async => dummyPositiveModelList);

      await homeViewModel.fetchAssetModelList();

      expect(homeViewModel.assetModelList, dummyPositiveModelList);
      verify(mockFinancialDataRepository.fetchAssetModelList());
      verifyNoMoreInteractions(mockFinancialDataRepository);
    });

    test('fetch and set debtModelList from the repository', () async {
      when(mockFinancialDataRepository.fetchDebtModelList()).thenAnswer((_) async => dummyNegativeModelList);

      await homeViewModel.fetchDebtModelList();

      expect(homeViewModel.debtModelList, dummyNegativeModelList);
      verify(mockFinancialDataRepository.fetchDebtModelList());
      verifyNoMoreInteractions(mockFinancialDataRepository);
    });
  });
}
