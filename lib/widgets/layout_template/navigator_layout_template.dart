import 'package:cognitive_assesment_test_app/views/games_screen/games_screen.dart';
import 'package:cognitive_assesment_test_app/views/home_screen/home_screen.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/blur_cover.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/center_view.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_app_bar.dart';
import 'package:flutter/material.dart';

class NavigatorLayoutTemplate extends StatefulWidget {
  const NavigatorLayoutTemplate({
    super.key,
  });

  @override
  State<NavigatorLayoutTemplate> createState() =>
      _NavigatorLayoutTemplateState();
}

class _NavigatorLayoutTemplateState extends State<NavigatorLayoutTemplate> {
  int _selectedPageIndex = 1;

  void selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = HomeScreen(selectPage: (index) => selectPage(index));
    String activePageTitle = 'Your profile';

    if (_selectedPageIndex == 0) {
      activePage = const StatsScreen();
      activePageTitle = 'Your Statistics';
    } else if (_selectedPageIndex == 1) {
      activePage = HomeScreen(selectPage: (index) => selectPage(index));
      activePageTitle = 'Home';
    } else if (_selectedPageIndex == 2) {
      activePage = GamesScreen();
      activePageTitle = 'Games';
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2F4858),
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: activePageTitle,
      ),
      body: Stack(
        children: [
          const AnimatedBackgroundContainer(),
          const BlurCover(),
          CenterView(
            child: activePage,
          ),
        ],
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF2F4858),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 163, 200, 223),
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color.fromARGB(255, 14, 0, 203),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.bar_chart),
              label: 'Stats',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.games),
              label: 'Games',
            )
          ],
        ),
      ),
    );
  }
}
