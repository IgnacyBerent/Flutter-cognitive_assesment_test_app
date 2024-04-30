import 'package:cognitive_assesment_test_app/api/auth.dart';
import 'package:cognitive_assesment_test_app/views/games/games_screen.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/buttons/my_icon_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final butotnsSpacing = const SizedBox(height: 25);

  @override
  Widget build(BuildContext context) {
    final auth = Authenticate();

    void logout() async {
      await auth.logout();
    }

    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyIconButton(
            icon: const Icon(Icons.bar_chart),
            buttonText: "Stats",
            placement: 'right',
            width: 260,
            height: 70,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const StatsScreen();
                  },
                ),
              );
            },
          ),
          butotnsSpacing,
          MyIconButton(
            icon: const Icon(Icons.games),
            buttonText: "Games",
            placement: 'right',
            width: 260,
            height: 70,
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const GamesScreen();
                  },
                ),
              );
            },
          ),
          butotnsSpacing,
          MyIconButton(
            buttonText: "Log Out",
            onPressed: logout,
            icon: const Icon(Icons.logout),
            placement: 'right',
            width: 260,
            height: 70,
          ),
        ],
      ),
    );
  }
}
