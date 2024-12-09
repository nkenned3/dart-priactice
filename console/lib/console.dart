int calculate(String input) {
  int result = 0;
    RegExp regExp = RegExp(r'mul\((\d+),(\d+)\)');
    Iterable<RegExpMatch> matches = regExp.allMatches(input);
    for (final match in matches)
    {
      print('Full match: ${match.group(0)}'); // Full match: mul(123,456)
      print('First group (n): ${match.group(1)}'); // First group: 123
      print('Second group (m): ${match.group(2)}'); // Second group: 456
      result += int.parse(match.group(1)!) * int.parse(match.group(2)!);
    }
  
  return result;
}
