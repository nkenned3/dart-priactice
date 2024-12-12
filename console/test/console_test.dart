import 'package:console/console.dart';
import 'package:test/test.dart';
import 'package:console/day_4_part_2.dart';
void main() {
  test('calculate', () {
    expect(calculate("mul(6,7)don't()%mul(2,2)dfdo()mul(2,3)"), 42 + 6);
  });

  test('grid', () {
    List<List<String>> grid = [
      ['S', 'M', 'S'],
      ['X', 'A', 'M'],
      ['M', 'A', 'M'],
      ['X', 'X', 'X']
    ];
    expect(wordSearch(grid), 1);
  });
}
