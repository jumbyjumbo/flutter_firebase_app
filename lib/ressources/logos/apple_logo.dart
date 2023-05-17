import 'package:flutter/material.dart';

class AppleLogo extends StatelessWidget {
  final double height;
  const AppleLogo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/apple.png',
      height: height,
    );
  }
}
