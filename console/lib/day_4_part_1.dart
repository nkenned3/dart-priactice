import 'dart:io';


int wordSearch(List<List<String>> input, String word)
{
    int m = input.length;
    int n = input[0].length;
    int count = 0;
    // "-1,-1" "0,1"	 "1,1"
    // "-1,0"	 "0,0"	 "1,0"
    // "-1,-1" "0,-1"	 "1,-1"

    List<int> dx = [1, 1, 1, 0, 0, -1, -1, -1];//[-1, -1, -1, 0, 0, 1, 1, 1];
    List<int> dy = [1, 0, -1, 1, -1, 1, 0, -1];//[ -1, 0, 1, -1, 1, -1, 0, 1 ];

    for (int i =0; i < m; i++)
    {
        for (int j = 0; j < n; j++)
        {
            for (int k = 0; k < 8; k++)
            {
                if (findWord(0, word, input, i, j, dx[k], dy[k]))
                {
                    count++;
                }
            }
        }
    }

    return count;
}

Future<List<List<String>>> readFileToList(String filePath) async {
  // Read the file content
  String contents = await File(filePath).readAsString();

  // Split the content into lines
  List<String> lines = contents.split('\n');

  // Split each line into a list of strings
  List<List<String>> result = lines.map((line) => line.trim().split('')).toList();

  return result;
}

bool validCoordinate(int x, int y, int maxX, int maxY)
{
  return x >= 0 && x < maxX && y >= 0 && y < maxY;
}

bool findWord(int index, String word, List<List<String>> grid, int x, int y, int dirX, int dirY)
{
  if (index == word.length)
  {
    print("index: $index");
    return true;
  }

  if (!validCoordinate(x, y, grid.length, grid[0].length))
  {
    return false;
  }

  if (grid[x][y] != word[index])
  {
    return false;
  }

  return findWord(index + 1, word, grid, x + dirX, y + dirY, dirX, dirY);
}