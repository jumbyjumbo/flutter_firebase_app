import 'package:flutter/material.dart';

class ProfileHub extends StatelessWidget {
  ProfileHub({super.key});
  final _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        //messages
        Container(
          color: Colors.red,
          child: const Center(
              child: Text('idk yet',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),

        //chatbox
        Container(
          color: Colors.green,
          child: const Center(
              child: Text('profile',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),

        //friends
        Container(
          color: Colors.yellow,
          child: const Center(
              child: Text('settings',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),
      ],
    );
  }
}
