import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/button/button_container.dart';

class MyButton extends StatelessWidget {
  const MyButton({super.key, required this.buttonText});
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
        child: Text(buttonText,
            style: const TextStyle(
                color: mobileBackgroundColor,
                fontWeight: FontWeight.w800,
                fontSize: 24)));
  }
}
