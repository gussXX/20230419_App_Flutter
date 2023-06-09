// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$Counter on CounterBase, Store {
  late final _$counterAtom =
      Atom(name: 'CounterBase.counter', context: context);

  @override
  int get counter {
    _$counterAtom.reportRead();
    return super.counter;
  }

  @override
  set counter(int value) {
    _$counterAtom.reportWrite(value, super.counter, () {
      super.counter = value;
    });
  }

  late final _$CounterBaseActionController =
      ActionController(name: 'CounterBase', context: context);

  @override
  void increment() {
    final _$actionInfo = _$CounterBaseActionController.startAction(
        name: 'CounterBase.increment');
    try {
      return super.increment();
    } finally {
      _$CounterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
counter: ${counter}
    ''';
  }
}

mixin _$Variables on VariablesBase, Store {
  late final _$indexListAtom =
      Atom(name: 'VariablesBase.indexList', context: context);

  @override
  int get indexList {
    _$indexListAtom.reportRead();
    return super.indexList;
  }

  @override
  set indexList(int value) {
    _$indexListAtom.reportWrite(value, super.indexList, () {
      super.indexList = value;
    });
  }

  late final _$switchvalueAtom =
      Atom(name: 'VariablesBase.switchvalue', context: context);

  @override
  bool get switchvalue {
    _$switchvalueAtom.reportRead();
    return super.switchvalue;
  }

  @override
  set switchvalue(bool value) {
    _$switchvalueAtom.reportWrite(value, super.switchvalue, () {
      super.switchvalue = value;
    });
  }

  late final _$isOpenAtom =
      Atom(name: 'VariablesBase.isOpen', context: context);

  @override
  bool get isOpen {
    _$isOpenAtom.reportRead();
    return super.isOpen;
  }

  @override
  set isOpen(bool value) {
    _$isOpenAtom.reportWrite(value, super.isOpen, () {
      super.isOpen = value;
    });
  }

  late final _$VariablesBaseActionController =
      ActionController(name: 'VariablesBase', context: context);

  @override
  void change() {
    final _$actionInfo = _$VariablesBaseActionController.startAction(
        name: 'VariablesBase.change');
    try {
      return super.change();
    } finally {
      _$VariablesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chanceswitchvalue() {
    final _$actionInfo = _$VariablesBaseActionController.startAction(
        name: 'VariablesBase.chanceswitchvalue');
    try {
      return super.chanceswitchvalue();
    } finally {
      _$VariablesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void chancepanel() {
    final _$actionInfo = _$VariablesBaseActionController.startAction(
        name: 'VariablesBase.chancepanel');
    try {
      return super.chancepanel();
    } finally {
      _$VariablesBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
indexList: ${indexList},
switchvalue: ${switchvalue},
isOpen: ${isOpen}
    ''';
  }
}
