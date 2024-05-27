import 'package:cognitive_assesment_test_app/models/game_stats/round_stat.dart';

/// `NumbersRoundStat` is a class that holds the statistics of a round in the Numbers game.
/// It extends the `RoundStat` class.
/// It holds the correct answer, the user's answer, and the time taken to complete the round.
/// It has a method that converts the object to a map.
///
/// Fields:
/// - `correctAnswer`: A list of integers that holds the correct answer in the round.
/// - `userAnswer`: A list of integers that holds the user's answer in the round.
/// - `time`: An integer that holds the time in ms taken to complete the round.
class NumbersRoundStat extends RoundStat {
  List<int> correctAnswer;
  List<int> userAnswer;
  int time;

  NumbersRoundStat({
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
