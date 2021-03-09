import 'package:finance_guru/data/source/financial_database_dao.dart';
import 'package:mockito/annotations.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'package:finance_guru/data/financial_data_repository.dart';

import 'financial_data_repository_test.mocks.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the bank', uuid: 1)];

@GenerateMocks([FinancialDatabaseDao])
void main() {
  MockFinancialDatabaseDao mockFinancialDatabaseDao = MockFinancialDatabaseDao();

  FinancialDataRepository financialDataRepository = FinancialDataRepository(dao: mockFinancialDatabaseDao);

  group('fetch positive data model list', () {
    test('should fetch and set assetModelList from the database, using dao', () async {
      // TODO: make mock class for dao & database
      when(mockFinancialDatabaseDao.fetchAssetModelList()).thenAnswer((_) async => dummyPositiveModelList);

      await financialDataRepository.fetchAssetModelList();

      expect(financialDataRepository.assetModelList, dummyPositiveModelList);
      verify(mockFinancialDatabaseDao.fetchAssetModelList());
      verifyNoMoreInteractions(mockFinancialDatabaseDao);
    });
  });
}
