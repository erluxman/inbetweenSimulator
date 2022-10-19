import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inbetween_sim/main.dart';
import 'package:inbetween_sim/state/gameboard.dart';

final gameBlocProvider = StateNotifierProvider<GameBoardBloc, GameBoard>((ref) {
  return GameBoardBloc();
});

class GameBoardBloc extends StateNotifier<GameBoard> {
  GameBoardBloc() : super(initialGameBoard);

  int get maxPlayerInRow {
    final int divisibleInRow = state.players.length - 2;
    if (divisibleInRow.isEven) {
      return divisibleInRow ~/ 2;
    } else {
      return divisibleInRow ~/ 2 + 1;
    }
  }
}

final GameBoard initialGameBoard = GameBoard(
  players: initialPlayers,
  moneyOnBoard: 0,
  handValue: 5,
  cardsOnDeck: shuffledCards,
);
final List<Player> initialPlayers = [
  Player(
    playerType: PlayerType.mathematical,
    riskLevel: 0.7,
    playerNumber: 1,
    playerName: "erluxman",
    moneyInPocket: 300,
    debt: 0,
    empathyLevel: 0.8,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.emotional,
    riskLevel: 0.8,
    playerNumber: 2,
    playerName: "Pizza",
    moneyInPocket: 300,
    debt: 0,
    empathyLevel: 0.7,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.emotional,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Tulsi",
    moneyInPocket: 400,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.mathematical,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Bipu",
    moneyInPocket: 500,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),

  //Need to replace players after this
  Player(
    playerType: PlayerType.emotional,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Tulsi",
    moneyInPocket: 400,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.mathematical,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Bipu",
    moneyInPocket: 500,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.emotional,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Tulsi",
    moneyInPocket: 400,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.mathematical,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Bipu",
    moneyInPocket: 500,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.emotional,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Tulsi",
    moneyInPocket: 400,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
  Player(
    playerType: PlayerType.mathematical,
    riskLevel: 0.85,
    playerNumber: 3,
    playerName: "Bipu",
    moneyInPocket: 500,
    debt: 0,
    empathyLevel: 0.5,
    investment: 0,
  ),
];

List<PlayingCard> get shuffledCards {
  List<PlayingCard> cardToReturn = [];
  for (int i = 1; i <= 13; i++) {
    for (final cardColor in PlayingCard.allColors) {
      cardToReturn.add(PlayingCard(color: cardColor, value: i));
    }
  }
  cardToReturn.shuffle(Random());

  return cardToReturn;
}
