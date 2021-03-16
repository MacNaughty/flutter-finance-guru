import 'package:finance_guru/data/source/i_financial_dao.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';


import 'package:finance_guru/data/source/financial_dao.dart';
import 'package:finance_guru/data/financial_data_repository.dart';
import 'package:test/test.dart';
import 'financial_data_repository_test.mocks.dart';
import '../commons/dummy_financial_data.dart';


class FakeFinancialDatabaseDao extends Fake implements IFinancialDao {

  // For the real dao implementation, these fields will not exist
  List<AssetModel> fakeAssetModelList = [];
  List<DebtModel> fakeDebtModelList = [];

  @override
  Future<List<AssetModel>> fetchAssetModelList() {
    return Future.value(fakeAssetModelList);
  }

  @override
  Future<void> addItemToAssetModelList(AssetModel assetModel) async {
    await Future.delayed(Duration(seconds: 1), () => fakeAssetModelList.add(assetModel));
  }

  @override
  Future<void> removeAssetModelById(String id) async {
    await Future.delayed(Duration(seconds: 1), () => fakeAssetModelList.removeWhere((element) => element.uuid == id));
  }

  @override
  Future<List<DebtModel>> fetchDebtModelList() {
    return Future.value(fakeDebtModelList);
  }

  @override
  Future<void> addItemToDebtModelList(DebtModel debtModel) async {
    await Future.delayed(Duration(seconds: 1), () => fakeDebtModelList.add(debtModel));
  }

  @override
  Future<void> removeDebtModelById(String id) async {
    await Future.delayed(Duration(seconds: 1), () => fakeDebtModelList.removeWhere((element) => element.uuid == id));
  }
}

@GenerateMocks([FinancialDao])
void main() {

  group('fetch assetModelList and debtModelList, using dao', () {

    MockFinancialDao mockFinancialDatabaseDao = MockFinancialDao();
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

    setUp(() {
      fakeFinancialDatabaseDao.fakeAssetModelList.addAll(fakeAssetModelList2);
      fakeFinancialDatabaseDao.fakeDebtModelList.addAll(fakeDebtModelList2);
    });

    tearDown(() {
      fakeFinancialDatabaseDao.fakeAssetModelList.clear();
      fakeFinancialDatabaseDao.fakeDebtModelList.clear();
    });

    test('add an asset model to list from the database, using dao', () async {
      expect(financialDataRepository.assetModelList, []);
      await financialDataRepository.fetchAssetModelList();
      expect(financialDataRepository.assetModelList, fakeAssetModelList2);

      await financialDataRepository.addAssetModelToList(testAsset0);
      List<AssetModel> tempList = [];
      tempList.addAll(fakeAssetModelList2);
      tempList.add(testAsset0);
      expect(financialDataRepository.assetModelList, tempList);

    });

    test('remove an asset model by index from list in the database, using dao', () async {
      expect(financialDataRepository.assetModelList, fakeAssetModelList2);
      String firstElementId = fakeAssetModelList2[0].uuid;
      await financialDataRepository.removeAssetModelById(firstElementId);
      List<AssetModel> tempList = [];
      tempList.addAll(fakeAssetModelList2);
      tempList.removeAt(0);
      expect(financialDataRepository.assetModelList, tempList);

    });

    test('remove an asset model by index from list in the database, using dao', () async {
      expect(financialDataRepository.assetModelList, fakeAssetModelList2);
      String thirdElementId = fakeAssetModelList2[2].uuid;

      await financialDataRepository.removeAssetModelById(thirdElementId);
      List<AssetModel> tempList = [];
      tempList.addAll(fakeAssetModelList2);
      tempList.removeAt(2);
      expect(financialDataRepository.assetModelList, tempList);

    });

    test('add many asset models to list from the database, using dao', () async {
      expect(financialDataRepository.assetModelList, fakeAssetModelList2);

      await financialDataRepository.addAssetModelToList(testAsset0);
      await financialDataRepository.addAssetModelToList(testAsset1);
      await financialDataRepository.addAssetModelToList(testAsset2);
      List<AssetModel> tempList = [];
      tempList.addAll(fakeAssetModelList2);
      tempList.add(testAsset0);
      tempList.add(testAsset1);
      tempList.add(testAsset2);
      expect(financialDataRepository.assetModelList, tempList);

    });

    test('add a debt model to list from the database, using dao', () async {
      expect(financialDataRepository.debtModelList, []);
      await financialDataRepository.fetchDebtModelList();
      expect(financialDataRepository.debtModelList, fakeDebtModelList2);

      await financialDataRepository.addDebtModelToList(testDebt0);
      List<DebtModel> tempList = [];
      tempList.addAll(fakeDebtModelList2);
      tempList.add(testDebt0);
      expect(financialDataRepository.debtModelList, tempList);

    });

    test('add many many debt models to list from the database, using dao', () async {
      expect(financialDataRepository.debtModelList, fakeDebtModelList2);

      await financialDataRepository.addDebtModelToList(testDebt0);
      await financialDataRepository.addDebtModelToList(testDebt1);
      List<DebtModel> tempList = [];
      tempList.addAll(fakeDebtModelList2);
      tempList.add(testDebt0);
      tempList.add(testDebt1);
      expect(financialDataRepository.debtModelList, tempList);

    });

    test('remove an asset debt by index from list in the database, using dao', () async {
      expect(financialDataRepository.debtModelList, fakeDebtModelList2);

      await financialDataRepository.removeDebtModelById(fakeDebtModelList2[1].uuid);
      List<DebtModel> tempList = [];
      tempList.addAll(fakeDebtModelList2);
      tempList.removeAt(1);
      expect(financialDataRepository.debtModelList, tempList);

    });

    test('remove multiple debt models by index from list in the database, using dao', () async {
      expect(financialDataRepository.debtModelList, fakeDebtModelList2);

      await financialDataRepository.removeDebtModelById(fakeDebtModelList2[1].uuid);
      await financialDataRepository.removeDebtModelById(fakeDebtModelList2[0].uuid);
      List<DebtModel> tempList = [];
      tempList.addAll(fakeDebtModelList2);
      tempList.removeAt(1);
      tempList.removeAt(0);
      expect(financialDataRepository.debtModelList, tempList);

    });
  });
}
