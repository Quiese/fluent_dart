import 'package:fluent_dart/validations/contract.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('BoolValidation isTrue', () {
    var wrong = Contract().requires().isTrue(false, "bool", "bool is false");
    expect(wrong.valid, false);
    var right = Contract().requires().isTrue(true, "bool", "bool is true");
    expect(right.valid, true);
  });

  test('BoolValidation isFalse', () {
    var wrong = Contract().requires().isFalse(true, "bool", "bool is true");
    expect(wrong.valid, false);
    var right = Contract().requires().isFalse(false, "bool", "bool is false");
    expect(right.valid, true);
  });
}
