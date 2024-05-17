import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'package:cognitive_assesment_test_app/views/games/numbers_game/numbers_game_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/start_screen_layout_template.dart';

class NumbersGameStartScreen extends StatelessWidget {
  const NumbersGameStartScreen({super.key});

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return StartScreenLayoutTemplate(
      gameName: "Numbers",
      gameDescription:
          "In this game you will hear numbers and you will have to repeat them in the reverse order.",
      exampleImage: Container(
        width: 200,
        height: 200,
        color: Colors.blue,
      ),
      roundsDescription: "The game consists of 10 questions.\n Good luck!",
      onPressed: () async {
        await _requestMicrophonePermission();
        if (!context.mounted) return;
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) {
              return const NumbersGameScreen();
            },
          ),
        );
      },
    );
  }
}
