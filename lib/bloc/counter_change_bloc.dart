import 'package:test_application_4310dakp/imports.dart';

class CounterChangeBloc extends Bloc<CounterChangeEvent, CounterChangeState> {
  CounterChangeBloc() : super(CounterChangeStateInit()) {
    on<CounterChangeEventInit>(_onInit);
    on<CounterChangeEventIncrement>(_onIncrement);
    on<CounterChangeEventDecrement>(_onDecrement);
  }

  _onInit(CounterChangeEvent event, Emitter<CounterChangeState> emit) async {
    emit(CounterChangeStateInitialised(await getCurrentValueAsync()));
  }

  _onIncrement(
      CounterChangeEvent event, Emitter<CounterChangeState> emit) async {
    emit(CounterChangeStateIncrement(await incrementApiAsync()));
  }

  _onDecrement(
      CounterChangeEvent event, Emitter<CounterChangeState> emit) async {
    emit(CounterChangeStateDecrement(await decrementApiAsync()));
  }
}
