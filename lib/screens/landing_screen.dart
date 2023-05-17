import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../utils/logo.dart';
import 'auth_hub.dart';
import 'click_hub.dart';
import 'social_hub.dart';

//list of hubs for navigation bar
final List<Widget> hubList = [
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
  int currentHub = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //top nav bar
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(25.0), // here the desired height
        child: Container(),
      ),

      //main body
      body: hubList[currentHub],

      //bottom nav bar
      bottomNavigationBar: NavigationBar(
        indicatorColor: Colors.transparent,
        elevation: 0,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        backgroundColor: Colors.transparent,
        destinations: [
          //social button
          NavigationDestination(
            selectedIcon: SvgPicture.asset(
              'assets/chat_selected.svg',
              colorFilter: const ColorFilter.mode(
                white,
                BlendMode.srcIn,
              ),
              height: 44,
            ),
            icon: SvgPicture.asset(
              'assets/chat.svg',
              colorFilter: const ColorFilter.mode(
                white,
                BlendMode.srcIn,
              ),
              height: 40,
            ),
            label: 'home',
          ),

          //click button
          const NavigationDestination(
            icon: Logo(height: 32),
            label: 'click',
          ),

          //profile button
          const NavigationDestination(
            selectedIcon: Icon(
              Icons.person,
              color: white,
              size: 40,
            ),
            icon: Icon(
              Icons.person_outline,
              color: white,
              size: 40,
            ),
            label: 'profile',
          )
        ],
        selectedIndex: currentHub,
        onDestinationSelected: (int hub) {
          setState(() {
            currentHub = hub;
          });
        },
      ),
    );
  }
}
