import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// `GameStatsNotifier` is a class that holds the statistics of a game.
/// It extends the `StateNotifier` class.
/// It holds a list of `RoundStat` objects.
/// It has methods to add a round to the list and to clear the list.
///
/// Fields:
/// - `state`: A list of `RoundStat` objects that holds the statistics of the game.
///
/// Methods:
/// - `addRound`: Adds a `RoundStat` object to the list.
/// - `clear`: Clears the list.
///
/// Providers:
/// - `gameStatsProvider`: A provider that creates a `GameStatsNotifier` object.
class GameStatsNotifier extends StateNotifier<List<RoundStat>> {
  GameStatsNotifier() : super([]);

  void addRound(RoundStat colorRoundStat) {
    state = [...state, colorRoundStat];
  }

  void clear() {
    state = [];
  }
}

final gameStatsProvider =
    StateNotifierProvider<GameStatsNotifier, List<RoundStat>>(
  (ref) => GameStatsNotifier(),
);
