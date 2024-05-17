import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cognitive_assesment_test_app/api/database.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/colors_game_elements/color_game_result_card.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/screens/colors_game_start_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/my_text_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';

class ColorGameResultsScreen extends ConsumerWidget {
  const ColorGameResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseApi();
    final gameStats = ref.watch(gameStatsProvider);

    // casting the gameStats to ColorRoundStat
    List<ColorRoundStat> results = [];
    for (var stat in gameStats) {
      if (stat is ColorRoundStat) {
        results.add(stat);
      }
    }

    return LayoutTemplate(
      screenName: "Color Game Results!",
      child: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ColorGameResultCard(
                  roundStat: results[index],
                  index: index,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          MyTextButton(
            buttonText: "SUBMIT",
            onPressed: () async {
              await db.saveColorGameResults(results);
              if (!context.mounted) return;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const ColorsGameStartScreen();
                  },
                ),
              );
            },
          ),
          const SizedBox(height: 30),
        ],
      ),
    );
  }
}
