import 'package:finance_guru/data/i_findata_repo.dart';
import 'package:finance_guru/model/financial_data_model.dart';
import 'package:finance_guru/vm/home_viewmodel.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';



class MockFinancialDataRepository extends Mock implements IFinDataRepository {

}

void main() {
  late HomeViewModel homeViewModel;
  late MockFinancialDataRepository mockFinancialDataRepository;

  setUp(() {
    mockFinancialDataRepository = MockFinancialDataRepository();
    homeViewModel = HomeViewModel(financialDataRepository: mockFinancialDataRepository);
  });

  final dummyPositiveModelList = [AssetModel(value: 100, title: 'Money in the bank', uuid: 1)];


  test(
      'should get positiveDataModelList from the repository',
          () async {
        // arrange
        when(mockFinancialDataRepository.fetchAssetModelList())
            .thenAnswer((_) async => dummyPositiveModelList);

        // act
        await homeViewModel.getAssetModelList();

        // assert
        expect(homeViewModel.assetList, dummyPositiveModelList);
        verify(mockFinancialDataRepository.fetchAssetModelList());
        verifyNoMoreInteractions(mockFinancialDataRepository);
      }


  );


}