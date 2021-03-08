import 'package:finance_guru/data/financial_data_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'home_viewmodel_test.mocks.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the bank', uuid: 1)];

@GenerateMocks([FinancialDataRepository])
void main() {

  MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
  HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);

  test(
      'should fetch and set assetModelList from the repository', () async {

        when(mockFinancialDataRepository.fetchAssetModelList())
            .thenAnswer((_) async => dummyPositiveModelList);

        await homeViewModel.getAssetModelList();

        expect(homeViewModel.assetModelList, dummyPositiveModelList);
        verify(mockFinancialDataRepository.fetchAssetModelList());
        verifyNoMoreInteractions(mockFinancialDataRepository);
      }
  );

}