import 'package:flutter/material.dart';
import '../ressources/auth_methods.dart';
import '../ressources/logos/apple_logo.dart';
//import '../ressources/logos/fb_logo.dart';
import '../ressources/logos/google_logo.dart';
import '../screens/landing_screen.dart';
import '../utils/colors.dart';

class ContinueWith3rdParty extends StatelessWidget {
  const ContinueWith3rdParty({super.key});

  @override
  Widget build(BuildContext context) {
    return //continue with 3rd party
        Column(
      children: [
        //or continue with
        const SizedBox(
          height: 30,
          child: Row(
            children: [
              Expanded(
                child: Divider(
                  color: white,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Text("Or continue with",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 16)),
              SizedBox(
                width: 8,
              ),
              Expanded(
                child: Divider(
                  color: white,
                ),
              ),
            ],
          ),
        ),
        //login with 3rd party
        SizedBox(
          height: 150,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              //login with google
              GestureDetector(
                onTap: () {
                  AuthMethods().signInWithGoogle().then((result) {
                    handleAuthResult(result, const LandingScreen(), context);
                  });
                },
                child: const Card(
                  color: white,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: GoogleLogo(height: 80)),
                ),
              ),
              const Spacer(),
              //login with apple
              GestureDetector(
                onTap: () {
                  AuthMethods().signInWithGoogle().then((result) {
                    handleAuthResult(result, const LandingScreen(), context);
                  });
                },
                child: const Card(
                  color: white,
                  child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppleLogo(height: 80)),
                ),
              ),
              const Spacer(),
              //login with facebook TODO #7
              //   GestureDetector(
              //     onTap: () {
              //       AuthMethods().signInWithGoogle().then((result) {
              //         handleAuthResult(result, const LandingScreen(), context);
              //       });
              //     },
              //     child: const Card(
              //       color: white,
              //       child: Padding(
              //           padding: EdgeInsets.all(8.0), child: FBLogo(height: 80)),
              //     ),
              //   ),
              //   const Spacer(),
            ],
          ),
        ),
      ],
    );
  }
}
