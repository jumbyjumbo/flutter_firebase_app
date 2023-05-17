import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../utils/logo.dart';
import 'authHub.dart';
import 'clickHub.dart';
import 'socialHub.dart';

//list of hubs for navigation bar
final List<Widget> pageList = [
  SocialHub(),
  ClickHub(),
  AuthHub(),
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
      //top nav bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0), // here the desired height
        child: Container(
          color: Colors.transparent,
          child: const Center(child: Text('My Custom AppBar')),
        ),
      ),

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
