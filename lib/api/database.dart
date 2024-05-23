import 'dart:convert';
import 'package:cognitive_assesment_test_app/api/debug_logs.dart';
import 'package:cognitive_assesment_test_app/models/dtos/game_score.dart';
import 'package:http/http.dart' as http;

import 'package:cognitive_assesment_test_app/api/jwt.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/cards_round_stat.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/numbers_round_stat.dart';

class DatabaseApi {
  final String url = "https://cognitivegamesbackend.onrender.com";
  final JwtToken jwt = JwtToken();

  Future<void> saveCardsGameResults(List<CardsRoundStat> results) async {
    final token = await jwt.getToken();
    final body = json.encode({
      "score_list": results.map((result) => result.toMap()).toList(),
    });

    final response = await http.post(
      Uri.parse("$url/add_new_score/memory_game"),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 200);
      throw Exception("Failed to save results");
    }
  }

  Future<void> saveColorGameResults(List<ColorRoundStat> results) async {
    final token = await jwt.getToken();
    final body = json.encode({
      "score_list": results.map((result) => result.toMap()).toList(),
    });

    final response = await http.post(
      Uri.parse("$url/add_new_score/color_game"),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 200);
      throw Exception("Failed to save results");
    }
  }

  Future<void> saveNumbersGameResults(List<NumbersRoundStat> results) async {
    final token = await jwt.getToken();
    final body = json.encode({
      "score_list": results.map((result) => result.toMap()).toList(),
    });

    final response = await http.post(
      Uri.parse("$url/add_new_score/number_game"),
      body: body,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 200);
      throw Exception("Failed to save results");
    }
  }

  Future<List<GameScore>> getGamesScores({required int gameId}) async {
    final token = await jwt.getToken();
    final response = await http.get(
      Uri.parse("$url/users/games/$gameId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 200);
      throw Exception("Failed to get scores");
    }
    final decoded = json.decode(response.body) as List;
    if (decoded.isEmpty) {
      return [];
    } else {
      return decoded.map((e) => GameScore.fromMap(e)).toList();
    }
  }

  Future<bool> isBelowAverage({required int gameId}) async {
    final token = await jwt.getToken();
    final response = await http.get(
      Uri.parse("$url/do_i_score_below_average/$gameId"),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token",
      },
    );

    if (response.statusCode != 200) {
      debugLogs(response.statusCode, 200);
      throw Exception("Failed to get scores");
    }
    final decoded = json.decode(response.body) as bool;
    return decoded;
  }
}
