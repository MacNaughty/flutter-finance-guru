import 'package:finance_guru/data/source/i_findata_dao.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';


import 'package:finance_guru/data/source/financial_database_dao.dart';
import 'package:finance_guru/data/financial_data_repository.dart';
import 'financial_data_repository_test.mocks.dart';
import '../commons/dummy_financial_data.dart';


class FakeFinancialDatabaseDao extends Fake implements IFinDataDao {

  @override
  Future<List<AssetModel>> fetchAssetModelList() {
    return Future.value(fakeAssetModelList2);
  }

  @override
  Future<List<DebtModel>> fetchDebtModelList() {
    return Future.value(fakeDebtModelList2);
  }

}

@GenerateMocks([FinancialDatabaseDao])
void main() {

  group('fetch assetModelList and debtModelList, using dao', () {

    MockFinancialDatabaseDao mockFinancialDatabaseDao = MockFinancialDatabaseDao();
    FinancialDataRepository financialDataRepository = FinancialDataRepository(dao: mockFinancialDatabaseDao);

    when(mockFinancialDatabaseDao.fetchAssetModelList()).thenAnswer((_) async => mockAssetModelList);
    when(mockFinancialDatabaseDao.fetchDebtModelList()).thenAnswer((_) async => mockDebtModelList);
    test('fetch assetModelList from the database, using dao', () async {
      expect(financialDataRepository.assetModelList, []);
      await financialDataRepository.fetchAssetModelList();

      expect(financialDataRepository.assetModelList, mockAssetModelList);
      verify(mockFinancialDatabaseDao.fetchAssetModelList());
      verifyNoMoreInteractions(mockFinancialDatabaseDao);
    });

    test('fetch debtModelList from the database, using dao', () async {
      expect(financialDataRepository.debtModelList, []);
      await financialDataRepository.fetchDebtModelList();

      expect(financialDataRepository.debtModelList, mockDebtModelList);
      verify(mockFinancialDatabaseDao.fetchDebtModelList());
      verifyNoMoreInteractions(mockFinancialDatabaseDao);
    });
  });

  group('update assetModelList and debtModelList, using dao', () {

    FakeFinancialDatabaseDao fakeFinancialDatabaseDao = FakeFinancialDatabaseDao();
    FinancialDataRepository financialDataRepository = FinancialDataRepository(dao: fakeFinancialDatabaseDao);

    test('add asset model to list from the database, using dao', () async {
      expect(financialDataRepository.assetModelList, []);
      await financialDataRepository.fetchAssetModelList();
      expect(financialDataRepository.assetModelList, fakeAssetModelList2);

      await financialDataRepository.addAssetModelToList(testAsset0);
      List<AssetModel> tempList = [];
      tempList.addAll(fakeAssetModelList2);
      tempList.add(testAsset0);
      expect(financialDataRepository.assetModelList, tempList);

    });


  });
}
