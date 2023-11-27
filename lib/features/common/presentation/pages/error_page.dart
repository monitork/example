import 'package:flutter/material.dart';

/// Default error page
class ErrorPage extends StatelessWidget {
  /// Default constructor for the [ErrorPage]
  const ErrorPage({super.key, required this.message});

  /// Error message displayed on the [ErrorPage]
  final String message;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(message)),
    );
  }
}
