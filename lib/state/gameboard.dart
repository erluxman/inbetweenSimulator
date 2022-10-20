class GameBoard {
  final List<Player> players;
  final List<PlayingCard> cardsOnDeck;
  final int moneyOnBoard;
  final int handValue;
  final bool isPaused;
  GameBoard({
    required this.players,
    required this.moneyOnBoard,
    required this.handValue,
    required this.cardsOnDeck,
    required this.isPaused,
  });

  GameBoard copyWith({
    List<Player>? players,
    List<PlayingCard>? cardsOnDeck,
    int? moneyOnBoard,
    int? handValue,
    bool? isPaused,
  }) {
    return GameBoard(
      players: players ?? this.players,
      moneyOnBoard: moneyOnBoard ?? this.moneyOnBoard,
      handValue: handValue ?? this.handValue,
      isPaused: isPaused ?? this.isPaused,
      cardsOnDeck: cardsOnDeck ?? this.cardsOnDeck,
    );
  }
}

//There will be two types of players
// 1. emotional and plays based on what they have
// 2. mathematical and plays what might be more probable.

class Player {
  final PlayerType playerType;
  final double riskLevel;
  final int playerNumber;
  final String playerName;
  final int moneyInPocket;
  final int debt;
  final double empathyLevel;
  final int investment;
  Player({
    required this.playerType,
    required this.riskLevel,
    required this.playerNumber,
    required this.playerName,
    required this.moneyInPocket,
    required this.debt,
    required this.empathyLevel,
    required this.investment,
  });

  Player copyWith({
    PlayerType? playerType,
    double? riskLevel,
    int? playerNumber,
    String? playerName,
    int? moneyInPocket,
    int? debt,
    double? empathyLevel,
    int? investment,
  }) {
    return Player(
      playerType: playerType ?? this.playerType,
      riskLevel: riskLevel ?? this.riskLevel,
      playerNumber: playerNumber ?? this.playerNumber,
      playerName: playerName ?? this.playerName,
      moneyInPocket: moneyInPocket ?? this.moneyInPocket,
      debt: debt ?? this.debt,
      empathyLevel: empathyLevel ?? this.empathyLevel,
      investment: investment ?? this.investment,
    );
  }
}

enum PlayerType { emotional, mathematical }

class PlayingCard {
  final String color;
  final int value;
  PlayingCard({
    required this.color,
    required this.value,
  });

  String get cardName {
    return '$color:${_valueAlias()}';
  }

  String _valueAlias() {
    switch (value) {
      case 1:
        return "A";
      case 11:
        return "J";
      case 12:
        return "Q";
      case 13:
        return "K";
      default:
        return "$value";
    }
  }

  @override
  String toString() => '$color : $value)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PlayingCard && other.color == color && other.value == value;
  }

  @override
  int get hashCode => color.hashCode ^ value.hashCode;

  static List<String> allColors = ["❤️", "♠️", "♦️", "♣️"];
}
