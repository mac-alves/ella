// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
  final _$estimatesAtom = Atom(name: '_HomeControllerBase.estimates');

  @override
  ObservableList<EstimateStore> get estimates {
    _$estimatesAtom.reportRead();
    return super.estimates;
  }

  @override
  set estimates(ObservableList<EstimateStore> value) {
    _$estimatesAtom.reportWrite(value, super.estimates, () {
      super.estimates = value;
    });
  }

  final _$currentEstimateAtom =
      Atom(name: '_HomeControllerBase.currentEstimate');

  @override
  EstimateStore get currentEstimate {
    _$currentEstimateAtom.reportRead();
    return super.currentEstimate;
  }

  @override
  set currentEstimate(EstimateStore value) {
    _$currentEstimateAtom.reportWrite(value, super.currentEstimate, () {
      super.currentEstimate = value;
    });
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setCurrentEstimate(int index) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setCurrentEstimate');
    try {
      return super.setCurrentEstimate(index);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estimates: ${estimates},
currentEstimate: ${currentEstimate}
    ''';
  }
}
