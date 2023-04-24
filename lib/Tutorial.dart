import 'package:flutter/material.dart';

class TicTacToeTutorialPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('How to Play Tic Tac Toe'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Welcome to our Tic Tac Toe game! Here\'s how to get started:',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Setting Up the Game',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'To play Tic Tac Toe, you\'ll need to download our app from the app store and install it on your device. Once you\'ve installed the app, open it up and you\'ll see the game board displayed on the screen.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'How to Play',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'The goal of Tic Tac Toe is to get three of your game pieces in a row on the game board. You\'ll take turns with your opponent placing your game pieces on the board until one of you gets three in a row or the game ends in a tie.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Game Board',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'The game board is a 3x3 grid of squares. To make a move, simply move your game piece to an empty square on the board. If you get three of your game pieces in a row (horizontally, vertically, or diagonally), you win the game! If the game board fills up with no winner, the game ends in a tie.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Tips for Winning',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Try to get two of your game pieces in a row. This will force your opponent to block you, giving you a chance to set up another row.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8.0),
            Text(
              '- Pay attention to where your opponent is placing their game pieces. If they\'re setting up a row, try to block them before they can complete it.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 8),
            Text(
              '- Keep the center square in mind. It\'s the most important square on the board, as it gives you the most opportunities to set up a row.',
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Text(
              'Conclusion',
              style: TextStyle(fontSize: 24.0),
            ),
            SizedBox(height: 8.0),
            Text(
              'That\'s all you need to know to start playing Tic Tac Toe. Remember, the key to winning is to pay attention to where your opponent is placing their pieces and to try to set up your own rows. Good luck!',
              style: TextStyle(fontSize: 16.0),
            ),
          ],
        ),
      ),
    );
  }
}
