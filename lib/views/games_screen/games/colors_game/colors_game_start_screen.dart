import 'package:cognitive_assesment_test_app/views/games_screen/games/colors_game/colors_game_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/start_game_button.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:permission_handler/permission_handler.dart';

class ColorsGameStartScreen extends StatelessWidget {
  const ColorsGameStartScreen({super.key});

  Future<void> _requestMicrophonePermission() async {
    var status = await Permission.microphone.status;
    if (!status.isGranted) {
      await Permission.microphone.request();
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutTemplate(
      screenName: "Colors Game",
      child: Column(
        children: [
          Text(
            "Welcome to the Colors Game!",
            style: GoogleFonts.lato(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            "In this game, you will be shown a color name and you have to say the color of the text, not the text itself.",
            style: GoogleFonts.karla(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Container(
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
          Text(
            "In this case, the answer is red.",
            style: GoogleFonts.karla(
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            "The game consists of 10 questions.\n Good luck!",
            style: GoogleFonts.karla(
              fontSize: 16,
            ),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          StartGameButton(
            onPressed: () async {
              await _requestMicrophonePermission();
              if (!context.mounted) return;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const ColorsGameScreen();
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
