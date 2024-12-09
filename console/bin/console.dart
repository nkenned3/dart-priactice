import 'package:console/console.dart' as console;
import 'dart:io';
import 'package:console/day_3_part_2.dart' as part_2;

void main(List<String> arguments) async {
  print('Merry Christmas!');
  String contents = await File('C:/DEV/dart-practice/console/input/day3.txt').readAsString();
  print('day 3 solutions: ${console.calculate(contents)}');

  print('day 3 part 2 solutions: ${part_2.calculatePart2(contents)}');
}
