import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cognitive_assesment_test_app/models/game_stats/color_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/colors_game_elements/result_card.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/my_text_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';

class ColorGameResultScreen extends ConsumerWidget {
  const ColorGameResultScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameStats = ref.watch(colorGameStatsProvider);

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
                return ResultCard(
                  roundStat: results[index],
                  index: index,
                );
              },
            ),
          ),
          const SizedBox(height: 30),
          MyTextButton(
            buttonText: "SUBMIT",
            onPressed: () {},
          )
        ],
      ),
    );
  }
}
