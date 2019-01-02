import 'package:test_api/test_api.dart';

import 'package:tic_tac_toe/game.dart';

void main() {
  test('List is same', () {
    Game game = Game();
    List<int> list = [1, 1, 1];

    bool res = game.listIsSame(list);

    expect(res, true);
  });

  test('List is different', () {
    Game game = Game();
    List<int> list = [1, 0, 1];

    bool res = game.listIsSame(list);

    expect(res, false);
  });

  test('Row is different with null elements', () {
    Game game = Game();
    game.field = [
      [null, null, null]
    ];

    bool res = game.rowIsSame(0);

    expect(res, false);
  });

  test('Column is same', () {
    Game game = Game();
    game.field = [
      [1, 1, 1]
    ];

    bool res = game.colIsSame(0);

    expect(res, true);
  });

  test('Left diagonal is same', () {
    Game game = Game();
    game.field = [
      [1, 0, 0],
      [0, 1, 0],
      [0, 0, 1]
    ];

    bool res = game.leftDiagonalIsSame();

    expect(res, true);
  });

  test('Right diagonal is same', () {
    Game game = Game();
    game.field = [
      [0, 0, 1],
      [0, 1, 0],
      [1, 0, 0]
    ];

    bool res = game.rightDiagonalIsSame();

    expect(res, true);
  });
}
