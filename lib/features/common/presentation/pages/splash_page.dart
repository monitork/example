import 'package:flutter/material.dart';

/// Default app splash screen
class SplashPage extends StatelessWidget {
  /// Default constructor for [SplashPage]
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Todo: let's stylize it at some point
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
