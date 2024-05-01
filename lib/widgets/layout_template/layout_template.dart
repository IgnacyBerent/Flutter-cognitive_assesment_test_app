import 'package:cognitive_assesment_test_app/widgets/layout_template/animated_background_container.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/blur_cover.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/center_view.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/layout_app_bar.dart';
import 'package:flutter/material.dart';

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
            child: child,
          ),
        ],
      ),
    );
  }
}
