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
      header(),
      Padding(padding: EdgeInsets.all(20), child: Board(game, this)),
      footer()
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
