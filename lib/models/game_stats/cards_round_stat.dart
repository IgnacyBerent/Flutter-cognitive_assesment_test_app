import 'package:cognitive_assesment_test_app/models/game_stats/game_stat.dart';

class CardsRoundStat extends GameStat {
  int wrongMatches;
  Duration time;

  CardsRoundStat({
    required this.wrongMatches,
    required this.time,
  });
}
