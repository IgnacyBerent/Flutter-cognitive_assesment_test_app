import 'package:cognitive_assesment_test_app/api/jwt.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/cards_round_stat.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/numbers_round_stat.dart';

class DatabaseApi {
  final String url = "";
  final JwtToken jwt = JwtToken();

  Future<void> saveCardsGameResults(List<CardsRoundStat> results) async {
    throw UnimplementedError();
  }

  Future<void> saveColorGameResults(List<ColorRoundStat> results) async {
    throw UnimplementedError();
  }

  Future<void> saveNumbersGameResults(List<NumbersRoundStat> results) async {
    throw UnimplementedError();
  }
}
