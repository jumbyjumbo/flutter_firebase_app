import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/button/button_container.dart';
import 'package:instagram_flutter/utils/google_logo.dart';

class GoogleButton extends StatelessWidget {
  final String buttonText;
  const GoogleButton({super.key, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return ButtonContainer(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(buttonText,
              style: const TextStyle(
                  color: backgroundColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 24)),
          const SizedBox(
            width: 32,
          ),
          const GoogleLogo(
            height: 32,
          ),
        ],
      ),
    );
  }
}
