import 'dart:io';

bool validCoordinate(int x, int y, int maxX, int maxY) {
  return x >= 0 && x < maxX && y >= 0 && y < maxY;
}

class Coordinate {
  final int x;
  final int y;
  Coordinate(this.x, this.y);
}

int wordSearch(List<List<String>> input) {
  int y = input.length;
  int x = input[0].length;
  int count = 0;
  int aCount = 0;

  File outputFile = File("c:/dev/dart-practice/logs/day4_part2.txt");
  IOSink sink = outputFile.openWrite();

  for (int i = 0; i < y; i++) {
    for (int j = 0; j < x; j++) {
      // for (int k = 0; k < 6; k++)
      // {
      if (input[i][j] == "A") {
        sink.writeln("found an A at i: $i, j: $j.  aCount: ${++aCount}");
        // String word = "MAS";
        // List<int> match = [];
        var topCorners = {
          Coordinate(-1, -1), // x, y top left
          Coordinate(-1, 1) // x, y top right
        };
        var bottomCorners = {
          Coordinate(1, -1), // x, y bottom left
          Coordinate(1, 1) // x, y bottom right
        };
        List<String> topMatches = [];
        List<String> bottomMatches = [];
        topMatches.addAll(getMatches(topCorners, input, i, j, y, x));
        bottomMatches.addAll(getMatches(bottomCorners, input, i, j, y, x));

        if (bottomMatches.length == 2 && topMatches.length == 2) {
          var bottom = bottomMatches.toSet();
          var top = topMatches.toSet();
          var left = {topMatches[0], bottomMatches[0]}.toSet();
          var right = {topMatches[1], bottomMatches[1]}.toSet();
          var disabledLetters = {"X", "A"};
          if (foundDiags(top, bottom, disabledLetters)) {
            sink.writeln(
                "TOP: $top, BOTTOM: $bottom - so incrementing a mas count");
            count++;
          } else if (foundDiags(left, right, disabledLetters)) {
            sink.writeln(
                "LEFT: $left, RIGHT: $right - so incrementing a mas count");
            count++;
          }
        }
      }
    }
  }

  return count;
}

List<String> getMatches(Set<Coordinate> coordinates, List<List<String>> input,
    int i, int j, int y, int x) {
  List<String> matches = [];
  for (var coordinate in coordinates) {
    if (validCoordinate(i + coordinate.x, j + coordinate.y, y, x)) {
      matches.add(input[i + coordinate.x][j + coordinate.y]);
    }
  }
  return matches;
}

bool foundDiags(Set<String> a, Set<String> b, Set<String> disabledLetters) {
  return a.length == 1 &&
      b.length == 1 &&
      !disabledLetters.contains(a.first) &&
      !disabledLetters.contains(b.first) &&
      a.first != b.first;
}

Future<List<List<String>>> readFileToList(String filePath) async {
  // Read the file content
  String contents = await File(filePath).readAsString();
  RegExp regExp = RegExp('A');
  Iterable<RegExpMatch> matches = regExp.allMatches(contents);
  print("file has ${matches.length} A's");
  // Split the content into lines
  List<String> lines = contents.split('\n');

  // Split each line into a list of strings
  List<List<String>> result =
      lines.map((line) => line.trim().split('')).toList();

  return result;
}
