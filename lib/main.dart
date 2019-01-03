import 'package:flutter/material.dart';
import 'package:tic_tac_toe/board.dart';
import 'package:tic_tac_toe/game.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  build(BuildContext context) => MaterialApp(
      title: 'TicTacToe',
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Tic Tac Toe', textAlign: TextAlign.center),
        ),
        body: TicTacToe(),
      ));
}

class TicTacToe extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return TicTacToeState();
  }
}

class TicTacToeState extends State {
  Game game = Game();

  header() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text('Current player:'),
          Icon(game.getCurrentPlayer() == 1
              ? Icons.fullscreen_exit
              : Icons.radio_button_unchecked)
        ],
      );

  board() => Padding(
        padding: EdgeInsets.all(20),
        child: Board(game, this),
      );

  footer() => GestureDetector(
      child: FloatingActionButton(
          child: Icon(Icons.refresh),
          onPressed: () {
            setState(() {
              game.startNewGame();
            });
          }));

  @override
  Widget build(BuildContext context) {
    List<Widget> widgets = [
      Padding(padding: EdgeInsets.fromLTRB(0, 10, 0, 0), child: header()),
      board(),
      OrientationBuilder(
          builder: (BuildContext context, Orientation orientation) {
        List<Widget> widgets = [
          footer(),
          FloatingActionButton(
            child: Text('check'),
            onPressed: () {
              if (game.isWon())
                showDialog(
                    context: context,
                    builder: (BuildContext context) =>
                        VictoryPopup(game.getWinner()));
            },
          ),
          Container(
            height: 50,
            width: 200,
            child: Card(
                child: Center(
              child: Text(
                  'Current game is' + (game.isWon() ? ' ' : ' not ') + 'won'),
            )),
          )
        ];
        return orientation == Orientation.portrait
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widgets)
            : Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widgets,
              );
      })
    ];

    return OrientationBuilder(
      builder: (context, orientation) {
        return orientation == Orientation.portrait
            ? Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widgets,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: widgets,
              );
      },
    );
  }
}

class VictoryPopup extends StatelessWidget {
  final int winner;

  VictoryPopup(this.winner);

  @override
  build(BuildContext context) => Center(
      child: FractionallySizedBox(
          heightFactor: .8,
          widthFactor: .8,
          child: Card(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text('The winner is'),
              Icon(winner == 1
                  ? Icons.fullscreen_exit
                  : Icons.radio_button_unchecked),
              FloatingActionButton(
                child: Icon(Icons.check),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ))));
}
