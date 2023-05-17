import 'package:flutter/material.dart';

class FBLogo extends StatelessWidget {
  final double height;
  const FBLogo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/fb.png',
      height: height,
    );
  }
}
