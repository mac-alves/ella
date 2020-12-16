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

  final _$selectedMothFilterAtom =
      Atom(name: '_HomeControllerBase.selectedMothFilter');

  @override
  String get selectedMothFilter {
    _$selectedMothFilterAtom.reportRead();
    return super.selectedMothFilter;
  }

  @override
  set selectedMothFilter(String value) {
    _$selectedMothFilterAtom.reportWrite(value, super.selectedMothFilter, () {
      super.selectedMothFilter = value;
    });
  }

  final _$isFilterAtom = Atom(name: '_HomeControllerBase.isFilter');

  @override
  bool get isFilter {
    _$isFilterAtom.reportRead();
    return super.isFilter;
  }

  @override
  set isFilter(bool value) {
    _$isFilterAtom.reportWrite(value, super.isFilter, () {
      super.isFilter = value;
    });
  }

  final _$isNotEstimateAtom = Atom(name: '_HomeControllerBase.isNotEstimate');

  @override
  bool get isNotEstimate {
    _$isNotEstimateAtom.reportRead();
    return super.isNotEstimate;
  }

  @override
  set isNotEstimate(bool value) {
    _$isNotEstimateAtom.reportWrite(value, super.isNotEstimate, () {
      super.isNotEstimate = value;
    });
  }

  final _$deleteCurrentEstimateAsyncAction =
      AsyncAction('_HomeControllerBase.deleteCurrentEstimate');

  @override
  Future<dynamic> deleteCurrentEstimate() {
    return _$deleteCurrentEstimateAsyncAction
        .run(() => super.deleteCurrentEstimate());
  }

  final _$updateCurrentEstimateAsyncAction =
      AsyncAction('_HomeControllerBase.updateCurrentEstimate');

  @override
  Future<dynamic> updateCurrentEstimate() {
    return _$updateCurrentEstimateAsyncAction
        .run(() => super.updateCurrentEstimate());
  }

  final _$_HomeControllerBaseActionController =
      ActionController(name: '_HomeControllerBase');

  @override
  void setEstimates(ObservableList<dynamic> value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setEstimates');
    try {
      return super.setEstimates(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

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
  void setInitialPage(int value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setInitialPage');
    try {
      return super.setInitialPage(value);
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
  void setSelectedMothFilter(String value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setSelectedMothFilter');
    try {
      return super.setSelectedMothFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsFilter(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsFilter');
    try {
      return super.setIsFilter(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setIsNotEstimate(bool value) {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setIsNotEstimate');
    try {
      return super.setIsNotEstimate(value);
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFilter() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.setFilter');
    try {
      return super.setFilter();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void clearFilter() {
    final _$actionInfo = _$_HomeControllerBaseActionController.startAction(
        name: '_HomeControllerBase.clearFilter');
    try {
      return super.clearFilter();
    } finally {
      _$_HomeControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
estimates: ${estimates},
currentEstimate: ${currentEstimate},
index: ${index},
initialPage: ${initialPage},
selectedMothFilter: ${selectedMothFilter},
isFilter: ${isFilter},
isNotEstimate: ${isNotEstimate}
    ''';
  }
}
