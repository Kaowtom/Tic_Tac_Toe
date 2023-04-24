import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ticing_and_toeing/game_state.dart';
import 'package:ticing_and_toeing/GameResults.dart';

class TicTacToeGame extends StatefulWidget {
  @override
  _TicTacToeGameState createState() => _TicTacToeGameState();
}

class _TicTacToeGameState extends State<TicTacToeGame> {
  List<List<String>> _board = [
    ['', '', ''],
    ['', '', ''],
    ['', '', ''],
  ];
  bool _player1Turn = true;
  bool _gameOver = false;
  String _winner = '';
  Player player1 = Player(name: 'Player 1');
  Player player2 = Player(name: 'Player 2');

  int _calculatePoints(String playerName) {
    return playerName == player1.name ? player1.score : player2.score;
  }

  void _markSquare(int row, int col) {
    GameState gameState = Provider.of<GameState>(context, listen: false);
    if (_board[row][col] == '') {
      setState(() {
        _board[row][col] = _player1Turn ? 'X' : 'O';
        _player1Turn = !_player1Turn;
        _checkGameOver();
        if (_gameOver && _winner.isNotEmpty) {
          gameState
              .incrementScore(_winner == "X" ? player1.name : player2.name);
        }
      });
    }
  }

  void _checkGameOver() {
    // Check rows
    for (int row = 0; row < 3; row++) {
      if (_board[row][0] != '' &&
          _board[row][0] == _board[row][1] &&
          _board[row][1] == _board[row][2]) {
        _gameOver = true;
        _winner = _board[row][0];
        return;
      }
    }

    // Check columns
    for (int col = 0; col < 3; col++) {
      if (_board[0][col] != '' &&
          _board[0][col] == _board[1][col] &&
          _board[1][col] == _board[2][col]) {
        _gameOver = true;
        _winner = _board[0][col];
        return;
      }
    }

    // Check diagonals
    if (_board[0][0] != '' &&
        _board[0][0] == _board[1][1] &&
        _board[1][1] == _board[2][2]) {
      _gameOver = true;
      _winner = _board[0][0];
      return;
    }

    if (_board[2][0] != '' &&
        _board[2][0] == _board[1][1] &&
        _board[1][1] == _board[0][2]) {
      _gameOver = true;
      _winner = _board[2][0];
      return;
    }

    // Check for tie
    if (!_board.any((row) => row.contains(''))) {
      _gameOver = true;
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    GameState gameState = Provider.of<GameState>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Tic-Tac-Toe'),
      ),
      body: SingleChildScrollView(
        // Add this
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildBoard(),
              if (_gameOver)
                _buildEndGameButton(gameState)
              else
                SizedBox(height: 20), // Add some spacing
              _buildWinnerMessage(gameState),
              if (_gameOver) _buildContinueButton()
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildContinueButton() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _gameOver = false;
            _winner = '';
            _board = [
              ['', '', ''],
              ['', '', ''],
              ['', '', ''],
            ];
          });
        },
        child: Text('Continue Game'),
      ),
    );
  }

  Widget _buildBoard() {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SizedBox(
        width: 200.0,
        height: 200.0,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
          ),
          itemBuilder: (context, index) {
            int row = index ~/ 3;
            int col = index % 3;
            return GestureDetector(
              onTap: () {
                if (!_gameOver) {
                  _markSquare(row, col);
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                ),
                child: Center(
                  child: Text(
                    _board[row][col],
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            );
          },
          itemCount: 9,
        ),
      ),
    );
  }

  Widget _buildEndGameButton(GameState gameState) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => GameResults(
                player1: gameState.player1,
                player2: gameState.player2,
              ),
            ),
          );
        },
        child: Text('End Game'),
      ),
    );
  }

  Widget _buildWinnerMessage(GameState gameState) {
    if (_winner.isNotEmpty) {
      String winnerName =
          _winner == "X" ? gameState.player1.name : gameState.player2.name;
      int winnerScore = _calculatePoints(winnerName);
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Column(
          children: [
            Text(
              '$winnerName wins!',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      );
    } else if (_gameOver) {
      return Padding(
        padding: EdgeInsets.only(top: 20),
        child: Text(
          'Tie Game!',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
    } else {
      return Column(
        children: [
          Text(
            'Player 1 Name:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            onChanged: (value) {
              gameState.setPlayerName(1, value);
            },
          ),
          SizedBox(height: 20), // Add some spacing
          Text(
            'Player 2 Name:',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          TextField(
            onChanged: (value) {
              gameState.setPlayerName(2, value);
            },
          ),
        ],
      );
    }
  }
}
