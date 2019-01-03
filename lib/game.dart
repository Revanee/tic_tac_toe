class Game {
  List<List<int>> field = [[]];

  Game() {
    startNewGame();
  }

  int currentPlayer = 1;

  cellIsFree(int x, int y) => getValueInCell(x, y) == null;

  setCell(int x, int y) {
    if (cellIsFree(x, y)) {
      field[y][x] = currentPlayer;
      switchPlayer();
    }
  }

  getValueInCell(int x, int y) => field[y][x];

  getCurrentPlayer() => currentPlayer;

  switchPlayer() {
    currentPlayer == 1 ? currentPlayer = 2 : currentPlayer = 1;
  }

  bool isWon() {
    return getWinner() != null;
  }

  int getWinner() {
    int winner;
    for (int i = 0; i < 3; i++) {
      if (rowIsSame(i)) winner = field[i][0];
      if (colIsSame(i)) winner = field[0][i];
    }
    if (leftDiagonalIsSame()) winner = field[0][0];
    if (rightDiagonalIsSame()) winner = field[field.length - 1][0];
    return winner;
  }

  bool colIsSame(int colIndex) {
    List<int> col = field.map((row) => row[colIndex]).toList();
    return listIsSame(col);
  }

  bool rowIsSame(int rowIndex) {
    List<int> row = field[rowIndex];
    return listIsSame(row);
  }

  bool leftDiagonalIsSame() {
    List<int> diagonal = [];
    for (int xy = 0; xy < field.length; xy++) {
      diagonal.add(field[xy][xy]);
    }
    return listIsSame(diagonal);
  }

  bool rightDiagonalIsSame() {
    List<int> diagonal = [];
    for (int i = 0; i < field.length; i++) {
      diagonal.add(field[i][(field.length - i) - 1]);
    }
    return listIsSame(diagonal);
  }

  bool listIsSame(List list) {
    int firstElement = list[0];
    bool listIsSame =
        list.map((x) => x == firstElement).reduce((res, val) => res && val);
    return listIsSame && firstElement != null;
  }

  startNewGame() {
    field = [
      [null, null, null],
      [null, null, null],
      [null, null, null]
    ];
    currentPlayer = 1;
  }
}
