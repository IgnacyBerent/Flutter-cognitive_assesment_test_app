import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/blur_cover.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/center_view.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_template_elements/layout_app_bar.dart';
import 'package:flutter/material.dart';

/// `LayoutTemplate` is a StatelessWidget that provides a layout for the application.
/// It takes in a screen name and a child widget.
/// The `build` method returns a `Scaffold` widget that contains an `AppBar` and a `Stack` widget.
/// The `Stack` widget contains an `AnimatedBackgroundContainer`, a `BlurCover`, and a `CenterView` widget.
/// The `CenterView` widget contains the child widget.
/// The `AppBar` widget displays the screen name.
///
/// Fields:
/// - `screenName`: A string that holds the name of the screen.
/// - `child`: A widget that holds the child widget.
///
/// Methods:
/// - `build(BuildContext context)`: A method that returns a `Scaffold` widget. The `Scaffold` widget contains an `AppBar` and a `Stack` widget.
class LayoutTemplate extends StatelessWidget {
  const LayoutTemplate({
    super.key,
    required this.screenName,
    required this.child,
  });

  final String screenName;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      appBar: LayoutAppBar(
        title: screenName,
      ),
      body: Stack(
        children: [
          const AnimatedBackgroundContainer(),
          const BlurCover(),
          CenterView(
            topPadding: 100,
            bottomPadding: 20,
            child: child,
          ),
        ],
      ),
    );
  }
}
