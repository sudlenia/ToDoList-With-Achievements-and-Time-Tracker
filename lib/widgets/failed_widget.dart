import 'package:flutter/material.dart';

class FailedWidget extends StatelessWidget {
  final String errorText;
  const FailedWidget({super.key, required this.errorText});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(errorText)),
    );
  }
}
