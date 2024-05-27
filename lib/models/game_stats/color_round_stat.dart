import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

/// `ColorRoundStat` is a class that holds the statistics of a round in the Color game.
/// It extends the `RoundStat` class.
/// It holds the correct answer, the user's answer, and the time taken to complete the round.
/// It has a method that converts the object to a map.
///
/// Fields:
/// - `correctAnswer`: A string that holds the correct answer in the round.
/// - `userAnswer`: A string that holds the user's answer in the round.
/// - `time`: An integer that holds the time in ms taken to complete the round.
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
