import 'package:flutter/material.dart';
import 'package:neumorphic_ui/neumorphic_ui.dart';

class ClickHub extends StatelessWidget {
  ClickHub({super.key});
  final _pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        //global upgrades
        GridView.count(
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Card(
              color: Colors.blue,
              child: Center(
                child: Text(
                  'upgrade $index',
                ),
              ),
            );
          }),
        ),
        //click buttons
        Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: NeumorphicButton(
                    onPressed: () {
                      print('click');
                    },
                    child: const Text('click'),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: double.infinity,
                  child: FloatingActionButton.large(
                    onPressed: () {
                      print('click');
                    },
                    backgroundColor: Colors.red,
                  ),
                ),
              ),
            ),
          ],
        ),
        //local upgrades
        GridView.count(
          crossAxisCount: 4,
          // Generate 100 widgets that display their index in the List.
          children: List.generate(100, (index) {
            return Card(
              color: Colors.yellow,
              child: Center(
                child: Text(
                  'upgrade $index',
                ),
              ),
            );
          }),
        ),
      ],
    );
  }
}
