import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';

class Logo extends StatelessWidget {
  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/logo.svg',
      colorFilter: const ColorFilter.mode(
        primaryColor,
        BlendMode.srcIn,
      ),
      height: 120,
    );
  }
}
