import 'package:flutter/material.dart';

class GoogleLogo extends StatelessWidget {
  final double height;
  const GoogleLogo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/google.png',
      height: height,
    );
  }
}
