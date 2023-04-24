import 'package:flutter/foundation.dart';

class Player {
  String name;
  int score;

  Player({required this.name, this.score = 0});
}

class GameState with ChangeNotifier {
  Player player1;
  Player player2;

  GameState({required this.player1, required this.player2});

  void incrementScore(String playerName) {
    if (playerName == player1.name) {
      player1.score++;
    } else {
      player2.score++;
    }
    notifyListeners();
  }

  void resetScore() {
    player1.score = 0;
    player2.score = 0;
    notifyListeners();
  }

  Player getCurrentPlayer() {
    return player1.score > player2.score ? player1 : player2;
  }

  int getPlayerScore(String playerName) {
    if (playerName == player1.name) {
      return player1.score;
    } else {
      return player2.score;
    }
  }

  void setPlayerName(int playerNumber, String name) {
    if (playerNumber == 1) {
      player1.name = name;
    } else {
      player2.name = name;
    }
    notifyListeners();
  }
}
