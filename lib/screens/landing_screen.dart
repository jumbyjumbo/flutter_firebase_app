import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../utils/logo.dart';

//list of pages for navigation bar
final List<Widget> pageList = [
  Container(
    alignment: Alignment.center,
    child: const Text('home',
        style:
            TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 70)),
  ),
  Container(
    alignment: Alignment.center,
    child: const Text('click',
        style:
            TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 70)),
  ),
  Container(
    alignment: Alignment.center,
    child: const Text('profile',
        style:
            TextStyle(color: white, fontWeight: FontWeight.bold, fontSize: 70)),
  ),
];

class LandingScreen extends StatefulWidget {
  const LandingScreen({super.key});

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  //page index for navigation bar
  int currentPageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //main body
      body: pageList[currentPageIndex],

      //bottom nav bar
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.transparent,
        destinations: const [
          //home button
          NavigationDestination(
            selectedIcon: Icon(
              Icons.home,
              color: white,
              size: 32,
            ),
            icon: Icon(
              Icons.home_outlined,
              color: white,
              size: 32,
            ),
            label: 'home',
          ),

          //click button
          NavigationDestination(
            icon: Logo(height: 32),
            label: 'click',
          ),

          //profile button
          NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: white,
              size: 32,
            ),
            icon: Icon(
              Icons.person_outline,
              color: white,
              size: 32,
            ),
            label: 'profile',
          )
        ],
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
      ),
    );
  }
}
