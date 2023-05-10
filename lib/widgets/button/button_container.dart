import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';

class ButtonContainer extends StatelessWidget {
  const ButtonContainer({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(vertical: 12),
      width: double.infinity,
      alignment: Alignment.center,
      decoration: const ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(32),
          ),
        ),
        color: primaryColor,
      ),
      child: child,
    );
  }
}
