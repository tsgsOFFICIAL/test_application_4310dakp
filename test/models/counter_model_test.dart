import 'package:test_application_4310dakp/imports.dart';
import 'package:test/test.dart';

void main() {
  group('Testing CounterModel', () {
    test('A new item should be added', () {
      CounterModel counterModel = CounterModel(counter: 0, text: '');
      // Fake API call returns a new CounterModel
      CounterModel newCounterModel = CounterModel(counter: 1, text: '');

      expect(counterModel.counter, 0);
      expect(newCounterModel.counter, 1);
    });

    test('An item should be removed', () {
      int number = 35;
      number--;
      expect(number, 34);
    });
  });
}
