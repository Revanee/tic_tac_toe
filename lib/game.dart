class Game {

  List<List<int>> field = [[]];

  Game() {
    startNewGame();
  }
  
  int currentPlayer = 1;

  cellIsFree(int x, int y) => getValueInCell(x, y) == 0;

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

  bool rowIsSame(int rowIndex) {
    List<int> row = field[rowIndex];
    int firstElement = row[0];
    bool rowIsSame = row
      .map((x) => x == firstElement)
      .reduce((res, val) => res && val);
    return rowIsSame && firstElement != null;
  }

  startNewGame() {
    field = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]];
    currentPlayer = 1;
  }
}