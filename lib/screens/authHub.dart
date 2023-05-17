import 'package:flutter/material.dart';

class AuthHub extends StatelessWidget {
  AuthHub({super.key});
  final _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        //login

        //signup

        //forgot password
      ],
    );
  }
}
