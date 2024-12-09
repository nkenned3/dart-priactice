import 'package:console/console.dart';
import 'package:test/test.dart';

void main() {
  test('calculate', () {
    expect(calculate("mul(6,7)don't()%mul(2,2)dfdo()mul(2,3)"), 42 + 6);
  });
}
