import 'package:flutter/material.dart';

class SocialHub extends StatelessWidget {
  SocialHub({super.key});
  final _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: const [
        //messages

        //chatbox

        //friends
      ],
    );
  }
}
