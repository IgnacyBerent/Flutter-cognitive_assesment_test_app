import 'package:cognitive_assesment_test_app/api/auth.dart';
import 'package:cognitive_assesment_test_app/api/jwt.dart';
import 'package:cognitive_assesment_test_app/views/login_register/login_screen.dart';
import 'package:cognitive_assesment_test_app/widgets/layout_template/navigator_layout_template.dart';
import 'package:flutter/material.dart';

import 'dart:async';

/// `WidgetTree` is a StatefulWidget that manages the authentication state of the application.
///
/// It periodically checks if the JWT token is expired. If the token is expired, it attempts to refresh it.
/// The state of the token (whether it's refreshed or not) is streamed via a `StreamController`.
///
/// The `build` method returns a `StreamBuilder` that listens to the `tokenController` stream.
/// Depending on the state of the token, it either shows the `NavigatorLayoutTemplate` (if the token is valid)
/// or the `LoginScreen` (if the token is not valid or couldn't be refreshed).
///
/// The `initState` method sets up a periodic timer that checks the token's state every 3 seconds.
///
/// The `dispose` method cancels the timer and closes the `tokenController` stream when the widget is disposed.
///
/// Fields:
/// - `tokenController`: A `StreamController` that streams the state of the token (true if the token couldn't be refreshed, false otherwise).
/// - `timer`: A `Timer` that periodically checks the state of the token.
/// - `auth`: An `Authenticate` object used to refresh the token.
class WidgetTree extends StatefulWidget {
  const WidgetTree({super.key});

  @override
  State<WidgetTree> createState() => _WidgetTreeState();
}

class _WidgetTreeState extends State<WidgetTree> {
  StreamController<bool> tokenController = StreamController<bool>();
  Timer? timer;
  Authenticate auth = Authenticate();

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(const Duration(seconds: 3), (timer) async {
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
