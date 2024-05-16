import 'package:cognitive_assesment_test_app/api/auth.dart';
import 'package:cognitive_assesment_test_app/api/jwt.dart';
import 'package:cognitive_assesment_test_app/views/login_register/login_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/navigator_layout_template.dart';
import 'package:flutter/material.dart';

import 'dart:async';

class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  StreamController<bool> tokenController = StreamController<bool>();
  Timer? timer;
  final auth = Authenticate();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3000), (timer) async {
      bool isTokenExpired = await JwtToken().isTokenExpired();
      if (isTokenExpired) {
        bool isTokenRefreshed = await auth.refreshToken();
        if (mounted) {
          setState(() {
            tokenController.add(!isTokenRefreshed);
          });
        }
      } else {
        if (mounted) {
          setState(() {
            tokenController.add(false);
          });
        }
      }
    });
  }

  @override
  void dispose() {
    timer?.cancel();
    timer = null;
    tokenController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<bool>(
      stream: tokenController.stream,
      builder: (context, snapshot) {
        return const NavigatorLayoutTemplate(); // TODO: delete after implementing the jwt logic
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else {
          if (snapshot.data == false) {
            return const NavigatorLayoutTemplate();
          } else {
            return const LoginScreen();
          }
        }
      },
    );
  }
}
