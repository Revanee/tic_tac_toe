import 'package:flutter/material.dart';
import 'package:tic_tac_toe/game.dart';

class Board extends StatefulWidget {
  final Game game;
  final State parent;

  Board(this.game, this.parent);

  @override
  State<StatefulWidget> createState() {
    return BoardState(game, parent);
  }
}

class BoardState extends State {
  Game game;
  State parent;

  BoardState(this.game, this.parent);

  cell(int x, int y) {
    int cellValue = game.getValueInCell(x, y);
    Icon currentIcon;

    switch (cellValue) {
      case 1:
        currentIcon = Icon(Icons.fullscreen_exit);
        break;
      case 2:
        currentIcon = Icon(Icons.radio_button_unchecked);
        break;
      default:
        currentIcon = Icon(null);
        break;
    }

    return GestureDetector(
        onTap: () {
          setState(() {
            game.setCell(x, y);
          });
          parent.setState(() => null);
        },
        child: Card(
            child: Container(
          alignment: Alignment.center,
          child: currentIcon,
        )));
  }

  boardRow(int index) => Row(children: <Widget>[
        Expanded(child: cell(index, 0)),
        Expanded(child: cell(index, 1)),
        Expanded(child: cell(index, 2)),
      ]);

  build(BuildContext context) => AspectRatio(
      aspectRatio: 1.0,
      child: Column(
        children: <Widget>[
          Expanded(child: boardRow(0)),
          Expanded(child: boardRow(1)),
          Expanded(child: boardRow(2)),
        ],
      ));
}
