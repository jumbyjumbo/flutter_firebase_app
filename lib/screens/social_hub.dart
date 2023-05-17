import 'package:flutter/material.dart';

class SocialHub extends StatelessWidget {
  SocialHub({super.key});
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
              child: Text('messages',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),

        //chatbox
        Container(
          color: Colors.green,
          child: const Center(
              child: Text('chatbox',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),

        //friends
        Container(
          color: Colors.yellow,
          child: const Center(
              child: Text('friends',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40))),
        ),
      ],
    );
  }
}
