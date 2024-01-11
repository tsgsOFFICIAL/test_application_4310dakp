import 'package:flutter/material.dart';
import 'package:test_application_4310dakp/models/counter_model.dart';
import 'package:test_application_4310dakp/services/api_service.dart';

class CounterProvider extends ChangeNotifier {
  late CounterModel? _counterModel = CounterModel(counter: 0, text: '');
  CounterModel? get counterModel => _counterModel;

  void incrementCounterAsync() async {
    _counterModel = await incrementApiAsync();
    notifyListeners();
  }

  void decrementCounterAsync() async {
    _counterModel = await decrementApiAsync();
    notifyListeners();
  }

  void updateCounterAsync() async {
    _counterModel = await getCurrentValueAsync();
    notifyListeners();
  }
}
