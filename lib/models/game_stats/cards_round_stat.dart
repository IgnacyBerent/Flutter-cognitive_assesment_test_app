import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

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
