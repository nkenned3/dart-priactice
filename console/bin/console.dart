import 'package:console/console.dart' as console;
import 'dart:io';

void main(List<String> arguments) async {
  print('Merry Christmas!');
  String contents = await File('C:/DEV/dart-practice/console/input/day3.txt').readAsString();
  print('day 3 solutions: ${console.calculate(contents)}');
}
