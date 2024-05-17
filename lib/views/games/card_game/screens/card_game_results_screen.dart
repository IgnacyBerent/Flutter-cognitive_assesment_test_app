import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:cognitive_assesment_test_app/api/database.dart';
import 'package:cognitive_assesment_test_app/models/game_stats/cards_round_stat.dart';
import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/card_game_elements/card_game_result_card.dart';
import 'package:cognitive_assesment_test_app/views/games/card_game/screens/card_game_start_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/my_text_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';

class CardGameResultsScreen extends ConsumerWidget {
  const CardGameResultsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final db = DatabaseApi();
    final gameStats = ref.watch(gameStatsProvider);

    // casting the gameStats to CardsRoundStas
    List<CardsRoundStat> results = [];
    for (var stat in gameStats) {
      if (stat is CardsRoundStat) {
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
                return CardGameResultCard(
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
              await db.saveCardsGameResults(results);
              if (!context.mounted) return;
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const CardGameStartScreen();
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
