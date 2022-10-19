import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:inbetween_sim/state/gameboard.dart';
import 'package:inbetween_sim/state/gameboard_provider.dart';

class GameBoardScreen extends ConsumerWidget {
  const GameBoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameBoard board = ref.watch(gameBlocProvider);

    return MaterialApp(
      home: Scaffold(
        body: board.players.length < 2
            ? const Center(
                child: Text("We need at least 2 players to play this game"))
            : const SafeArea(
                child: GameBoardBody(),
              ),
      ),
    );
  }
}

class GameBoardBody extends ConsumerWidget {
  const GameBoardBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameBoard board = ref.watch(gameBlocProvider);
    final GameBoardBloc game = ref.read(gameBlocProvider.notifier);

    if (board.players.length < 2) {
      return Text("We need at least 2 players to play this game");
    }
    final topRowPlayers = board.players.sublist(0, game.maxPlayerInRow);
    final playerOnLeft = board.players[game.maxPlayerInRow];
    final playerOnRight = board.players[game.maxPlayerInRow + 1];
    final bottomRowPlayers = board.players.sublist(game.maxPlayerInRow + 2);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                topRowPlayers.map((player) => PlayerInfoCard(player)).toList(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlayerInfoCard(playerOnLeft),
              const Spacer(),
              const GameBoardCenterInfoCard(),
              const Spacer(),
              PlayerInfoCard(playerOnRight),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: bottomRowPlayers
                .map((player) => PlayerInfoCard(player))
                .toList(),
          ),
        ],
      ),
    );
  }
}

class GameBoardCenterInfoCard extends ConsumerWidget {
  const GameBoardCenterInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final GameBoard board = ref.watch(gameBlocProvider);

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(150.0),
      ),
      margin: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 100,
        height: 100,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "₹${board.moneyOnBoard}\n"
                  "🃏${board.cardsOnDeck.length}",
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class PlayerInfoCard extends ConsumerWidget {
  const PlayerInfoCard(
    this.player, {
    Key? key,
  }) : super(key: key);
  final Player player;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      margin: const EdgeInsets.all(4),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text("#${player.playerNumber}"),
            Text(player.playerName),
            Text("₹${player.moneyInPocket}\n")
          ],
        ),
      ),
    );
  }
}
