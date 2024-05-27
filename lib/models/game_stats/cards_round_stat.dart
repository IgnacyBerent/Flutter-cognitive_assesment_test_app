import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

/// `CardsRoundStat` is a class that holds the statistics of a round in the Cards game.
/// It extends the `RoundStat` class.
/// It holds the number of wrong matches and the time taken to complete the round.
/// It has a method that converts the object to a map.
///
/// Fields:
/// - `wrongMatches`: An integer that holds the number of wrong matches in the round.
/// - `time`: An integer that holds the time in ms taken to complete the round.
class CardsRoundStat extends RoundStat {
  int wrongMatches;
  int time;

  CardsRoundStat({
    required this.wrongMatches,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'wrongMatches': wrongMatches,
      'time': time,
    };
  }
}
