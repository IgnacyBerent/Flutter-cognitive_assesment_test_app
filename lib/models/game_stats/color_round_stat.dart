import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

class ColorRoundStat extends RoundStat {
  String correctAnswer;
  String userAnswer;
  int time;

  ColorRoundStat({
    required this.correctAnswer,
    required this.userAnswer,
    required this.time,
  });

  Map<String, dynamic> toMap() {
    return {
      'correctAnswer': correctAnswer,
      'userAnswer': userAnswer,
      'time': time,
    };
  }
}
