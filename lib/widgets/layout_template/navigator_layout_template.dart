import 'package:cognitive_assesment_test_app/views/games/games_screen.dart';
import 'package:cognitive_assesment_test_app/views/home_screen/home_screen.dart';
import 'package:cognitive_assesment_test_app/views/stats_screen/stats_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/centered_view.dart';
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
  int _selectedPageIndex = 0;

  void selectPage(int index) => setState(() => _selectedPageIndex = index);

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();
    String activePageTitle = 'Your profile';

    if (_selectedPageIndex == 1) {
      activePage = const StatsScreen();
      activePageTitle = 'Your Statistics';
    } else if (_selectedPageIndex == 0) {
      activePage = const HomeScreen();
      activePageTitle = 'Home';
    } else if (_selectedPageIndex == 2) {
      activePage = const GamesScreen();
      activePageTitle = 'Games';
    }

    return Scaffold(
      backgroundColor: const Color(0xFF2F4858),
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: activePageTitle,
      ),
      body: AnimatedBackgroundContainer(
        child: CenteredView(
          child: activePage,
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: const Color(0xFF2F4858),
        ),
        child: BottomNavigationBar(
          elevation: 0,
          backgroundColor: const Color(0xFF2F4858),
          onTap: selectPage,
          currentIndex: _selectedPageIndex,
          selectedItemColor: const Color(0xFF00CB94),
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.chat_rounded),
              label: 'Stats',
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
