import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:cognitive_assesment_test_app/providers/game_stats_provider.dart';
import 'package:cognitive_assesment_test_app/views/games/colors_game/screens/colors_game_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/start_screen_layout_template.dart';

class ColorsGameStartScreen extends ConsumerWidget {
  const ColorsGameStartScreen({super.key});

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const numberOfRounds = 10;

    return StartScreenLayoutTemplate(
      gameName: "Colors",
      gameDescription:
          "In this game, you will be shown a color name and you have to say the color of the text, not the text itself.",
      exampleImage: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
        child: Center(
          child: Text(
            "Green",
            style: GoogleFonts.roboto(
              fontSize: 50,
              color: Colors.red,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      imageDescription: "In this case, the answer is red.",
      roundsDescription:
          "The game consists of $numberOfRounds questions.\nGood luck!",
      onPressed: () async {
        await _requestMicrophonePermission();
        if (!context.mounted) return;
        ref.read(gameStatsProvider.notifier).clear();
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const ColorsGameScreen(
                numberOfRounds: numberOfRounds,
              );
            },
          ),
        );
      },
    );
  }
}
