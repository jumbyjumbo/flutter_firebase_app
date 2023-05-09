import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText});
  final String buttonText;

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
      child: Text(buttonText,
          style: const TextStyle(
              color: mobileBackgroundColor,
              fontWeight: FontWeight.w800,
              fontSize: 23)),
    );
  }
}
