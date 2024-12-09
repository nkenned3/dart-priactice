int calculatePart2(String input) {
  int result = 0;
  RegExp regExp = RegExp(r"do\(\)|don't\(\)|mul\((\d+),(\d+)\)");
  var matches = regExp.allMatches(input); //.toList();
  bool enabled = true;
  for (final match in matches) {
    print('Full match: ${match.group(0)}'); // Full match: mul(123,456)
    if (match.group(0) == "do()") {
      print("found do");
      enabled = true;
    } else if (match.group(0) == "don't()") {
      print("found dont");
      enabled = false;
    }
    else if (enabled) {
      print('First group (n): ${match.group(1)}'); // First group: 123
      print('Second group (m): ${match.group(2)}'); // Second group: 456
      result += int.parse(match.group(1)!) * int.parse(match.group(2)!);
      print ("enabled, so result increases to: $result");
    }
    else if (!enabled) {
      print('First group (n): ${match.group(1)}'); // First group: 123
      print('Second group (m): ${match.group(2)}'); // Second group: 456
      print ("disabled, so result stays at: $result");
    }
  }

  return result;
}
