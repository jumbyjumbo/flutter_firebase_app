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

        //profile
        Column(
          children: [
            const SizedBox(
              height: 80,
            ),
            Title(
              color: Colors.white,
              child: const Text(
                'profile',
                style: TextStyle(
                    fontSize: 60,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const CircleAvatar(
              radius: 50,
            )
          ],
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
