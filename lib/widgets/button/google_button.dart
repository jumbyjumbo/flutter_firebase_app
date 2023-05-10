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
          const GoogleLogo(
            height: 32,
          ),
          const SizedBox(
            width: 18,
          ),
          Text(buttonText,
              style: const TextStyle(
                  color: mobileBackgroundColor,
                  fontWeight: FontWeight.w800,
                  fontSize: 24)),
        ],
      ),
    );
  }
}
