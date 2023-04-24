import 'package:flutter/material.dart';
import 'package:ticing_and_toeing/game_state.dart';
import 'package:ticing_and_toeing/main.dart';

class GameResults extends StatelessWidget {
  final Player player1;
  final Player player2;

  GameResults({required this.player1, required this.player2});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Game Results'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${player1.name}: ${player1.score}',
              style: TextStyle(fontSize: 24),
            ),
            Text(
              '${player2.name}: ${player2.score}',
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
