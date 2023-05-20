import 'package:flutter/material.dart';
import 'hubs/auth_hub.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LoginScreen> {
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
      body: AuthHub(),

      //bottom nav bar
      bottomNavigationBar: const SizedBox(
        height: 50,
      ),
    );
  }
}
