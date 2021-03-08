import 'package:mockito/annotations.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../../lib/data/financial_data_repository.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the bank', uuid: 1)];


void main() {
  FinancialDataRepository financialDataRepository = FinancialDataRepository.instance;

  group('fetchPost', () {
    test('should fetch and set assetModelList from the database, using dao', () async {
      // TODO: make mock class for dao & database
      when(dataSource.fetchAssetModelList()).thenAnswer((_) async => dummyPositiveModelList);

      expect(financialDataRepository.assetModelList, dummyPositiveModelList);
      // verify(mockFinancialDataRepository.fetchAssetModelList());
      // verifyNoMoreInteractions(mockFinancialDataRepository);
    });
  });
}
