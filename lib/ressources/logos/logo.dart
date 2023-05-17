import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';

class Logo extends StatelessWidget {
  final double height;
  const Logo({super.key, required this.height});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo.svg',
      colorFilter: const ColorFilter.mode(
        white,
        BlendMode.srcIn,
      ),
      height: height,
    );
  }
}
