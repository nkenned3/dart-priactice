import 'package:console/console.dart' as console;
import 'dart:io';
import 'package:console/day_3_part_2.dart' as part_2;
import 'package:console/day_4_part_1.dart' as day_4_part_1;
void main(List<String> arguments) async {
  print('Merry Christmas!');
  //String contents = await File('C:/DEV/dart-practice/console/input/day3.txt').readAsString();
  //print('day 3 solutions: ${console.calculate(contents)}');

  //print('day 3 part 2 solutions: ${part_2.calculatePart2(contents)}');

  print('day 4 part 1 solutions: ${day_4_part_1.wordSearch(await day_4_part_1.readFileToList('C:/DEV/dart-practice/console/input/day4.txt'), 'XMAS')}');
}
