import 'package:flutter_test/flutter_test.dart';

import 'package:string_utils_abdullah_0120/string_utils_abdullah_0120.dart';

void main() {
  test('adds one to input values', () {
    final calculator = Calculator();
    expect(calculator.addOne(2), 3);
    expect(calculator.addOne(-7), -6);
    expect(calculator.addOne(0), 1);
  });
}
