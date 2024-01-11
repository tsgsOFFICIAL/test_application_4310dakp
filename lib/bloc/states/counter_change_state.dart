import 'package:test_application_4310dakp/imports.dart';

abstract class CounterChangeState {}

abstract class CounterChangeStateWithData extends CounterChangeState {
  @mustCallSuper
  final CounterModel? dataModel;

  CounterChangeStateWithData({required this.dataModel});
}

class CounterChangeStateInit extends CounterChangeState {}

class CounterChangeStateInitialised extends CounterChangeStateWithData {
  CounterChangeStateInitialised(CounterModel? data) : super(dataModel: data);
}

class CounterChangeStateIncrement extends CounterChangeStateWithData {
  CounterChangeStateIncrement(CounterModel? data) : super(dataModel: data);
}

class CounterChangeStateDecrement extends CounterChangeStateWithData {
  CounterChangeStateDecrement(CounterModel? data) : super(dataModel: data);
}
