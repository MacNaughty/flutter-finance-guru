import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the bank', uuid: 1)];

class MockFinancialDataRepository extends Mock implements IFinDataRepository {}

void main() {

  MockFinancialDataRepository mockFinancialDataRepository = MockFinancialDataRepository();
  HomeViewModel homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);


  test(
      'should get positiveDataModelList from the repository', () async {

        when(mockFinancialDataRepository.fetchAssetModelList())
            .thenAnswer((_) async => dummyPositiveModelList);

        await homeViewModel.getAssetModelList();


        expect(homeViewModel.assetList, dummyPositiveModelList);
        verify(mockFinancialDataRepository.fetchAssetModelList());
        verifyNoMoreInteractions(mockFinancialDataRepository);
      }


  );


}