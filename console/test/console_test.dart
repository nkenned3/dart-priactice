import 'package:console/console.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate("mul(6,7)"), 42);
  });
}
