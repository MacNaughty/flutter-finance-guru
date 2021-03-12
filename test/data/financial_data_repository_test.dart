import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';


import 'package:finance_guru/data/source/financial_database_dao.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:finance_guru/data/financial_data_repository.dart';
import 'financial_data_repository_test.mocks.dart';
import '../commons/dummy_financial_data.dart';

@GenerateMocks([FinancialDatabaseDao])
void main() {
  MockFinancialDatabaseDao mockFinancialDatabaseDao = MockFinancialDatabaseDao();

  FinancialDataRepository financialDataRepository = FinancialDataRepository(dao: mockFinancialDatabaseDao);

  group('fetch positive data model list', () {
    when(mockFinancialDatabaseDao.fetchAssetModelList()).thenAnswer((_) async => mockAssetModelList);
    when(mockFinancialDatabaseDao.fetchDebtModelList()).thenAnswer((_) async => mockDebtModelList);
    test('should fetch and set assetModelList from the database, using dao', () async {


      await financialDataRepository.fetchAssetModelList();

      expect(financialDataRepository.assetModelList, mockAssetModelList);
      verify(mockFinancialDatabaseDao.fetchAssetModelList());
      verifyNoMoreInteractions(mockFinancialDatabaseDao);
    });

    test('should fetch and set debtModelList from the database, using dao', () async {
      await financialDataRepository.fetchDebtModelList();

      expect(financialDataRepository.debtModelList, mockDebtModelList);
      verify(mockFinancialDatabaseDao.fetchDebtModelList());
      verifyNoMoreInteractions(mockFinancialDatabaseDao);
    });
  });
}
