// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// InjectionGenerator
// **************************************************************************

final $HomeController = BindInject(
  (i) => HomeController(i<MoneyController>()),
  singleton: true,
  lazy: true,
);

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeControllerBase, Store {
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

  final _$indexAtom = Atom(name: '_HomeControllerBase.index');

  @override
  int get index {
    _$indexAtom.reportRead();
    return super.index;
  }

  @override
  set index(int value) {
    _$indexAtom.reportWrite(value, super.index, () {
      super.index = value;
    });
  }

  final _$initialPageAtom = Atom(name: '_HomeControllerBase.initialPage');

  @override
  int get initialPage {
    _$initialPageAtom.reportRead();
    return super.initialPage;
  }

  @override
  set initialPage(int value) {
    _$initialPageAtom.reportWrite(value, super.initialPage, () {
      super.initialPage = value;
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
  void setInitialPage() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setInitialPage');
    try {
      return super.setInitialPage();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIndex(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIndex');
    try {
      return super.setIndex(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentEstimate: ${currentEstimate},
index: ${index},
initialPage: ${initialPage}
    ''';
  }
}
