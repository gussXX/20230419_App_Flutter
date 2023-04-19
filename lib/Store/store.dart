import 'package:mobx/mobx.dart';

part 'store.g.dart';

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
  late int indexList;

  @action
  void change() {
  print('função chamada, o valor foi alterado');
}
}

