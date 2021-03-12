// Mocks generated by Mockito 5.0.0 from annotations
// in finance_guru/test/vm/home_viewmodel_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i5;

import 'package:finance_guru/data/financial_data_repository.dart' as _i3;
import 'package:finance_guru/data/source/i_findata_dao.dart' as _i2;
import 'package:finance_guru/model/financial_data_model.dart' as _i4;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: comment_references
// ignore_for_file: unnecessary_parenthesis

class _FakeIFinDataDao extends _i1.Fake implements _i2.IFinDataDao {}

/// A class which mocks [FinancialDataRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockFinancialDataRepository extends _i1.Mock
    implements _i3.FinancialDataRepository {
  MockFinancialDataRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i2.IFinDataDao get finDataDao =>
      (super.noSuchMethod(Invocation.getter(#finDataDao),
          returnValue: _FakeIFinDataDao()) as _i2.IFinDataDao);
  @override
  set finDataDao(_i2.IFinDataDao? _finDataDao) =>
      super.noSuchMethod(Invocation.setter(#finDataDao, _finDataDao),
          returnValueForMissingStub: null);
  @override
  List<_i4.AssetModel> get assetModelList =>
      (super.noSuchMethod(Invocation.getter(#assetModelList),
          returnValue: <_i4.AssetModel>[]) as List<_i4.AssetModel>);
  @override
  List<_i4.DebtModel> get debtModelList =>
      (super.noSuchMethod(Invocation.getter(#debtModelList),
          returnValue: <_i4.DebtModel>[]) as List<_i4.DebtModel>);
  @override
  _i5.Future<List<_i4.AssetModel>> fetchAssetModelList() =>
      (super.noSuchMethod(Invocation.method(#fetchAssetModelList, []),
              returnValue: Future.value(<_i4.AssetModel>[]))
          as _i5.Future<List<_i4.AssetModel>>);
  @override
  _i5.Future<void> addAssetModelToList(_i4.AssetModel? assetModel) =>
      (super.noSuchMethod(Invocation.method(#addAssetModelToList, [assetModel]),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<void> removeAssetModelByIndex(int? i) =>
      (super.noSuchMethod(Invocation.method(#removeAssetModelByIndex, [i]),
          returnValue: Future.value(null),
          returnValueForMissingStub: Future.value()) as _i5.Future<void>);
  @override
  _i5.Future<List<_i4.DebtModel>> fetchDebtModelList() =>
      (super.noSuchMethod(Invocation.method(#fetchDebtModelList, []),
              returnValue: Future.value(<_i4.DebtModel>[]))
          as _i5.Future<List<_i4.DebtModel>>);
}
