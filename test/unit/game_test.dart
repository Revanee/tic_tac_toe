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
    List<List<int>> field = [[null, null, null]];
    game.field = field;

    bool res = game.rowIsSame(0);

    expect(res, false);
  });
}