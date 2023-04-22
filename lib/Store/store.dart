import 'package:mobx/mobx.dart';
part 'store.g.dart';

// Build Run --> flutter packages pub run build_runner watch

class Counter = CounterBase with _$Counter;

abstract class CounterBase with Store {
  @observable
  int counter = 0;

  @action
  void increment() {
    counter++;
  }
}

class Variables = VariablesBase with _$Variables;

abstract class VariablesBase with Store {
  @observable
  int indexList = 0;

  @observable
  bool switchvalue = false;

  @action
  void change() {}

  @action
  void chanceswitchvalue() {
    switchvalue = !switchvalue;
  }
}
