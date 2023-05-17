import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../ressources/auth_methods.dart';
import '../utils/apple_logo.dart';
import '../utils/fb_logo.dart';
import '../utils/google_logo.dart';
import '../widgets/text_field_input.dart';
import 'landing_screen.dart';

class AuthHub extends StatelessWidget {
  AuthHub({super.key});
  final _pageController = PageController(initialPage: 1);
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: [
        //login
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //login with 3rd party
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //login with google
                  Expanded(
                    child: Card(
                      child: IconButton(
                        onPressed: () {
                          AuthMethods().signInWithGoogle().then((result) {
                            handleAuthResult(
                                result, const LandingScreen(), context);
                          });
                        },
                        icon: const GoogleLogo(height: 80),
                      ),
                    ),
                  ),
                  //login with apple
                  Expanded(
                    child: Card(
                      child: IconButton(
                        onPressed: () {
                          AuthMethods().signInWithGoogle().then((result) {
                            handleAuthResult(
                                result, const LandingScreen(), context);
                          });
                        },
                        icon: const AppleLogo(height: 80),
                      ),
                    ),
                  ),
                  //login with facebook
                  Expanded(
                    child: Card(
                      child: IconButton(
                        onPressed: () {
                          AuthMethods().signInWithGoogle().then((result) {
                            handleAuthResult(
                                result, const LandingScreen(), context);
                          });
                        },
                        icon: const FBLogo(height: 80),
                      ),
                    ),
                  ),
                ],
              ),

              //inputs
              Column(
                children: [
                  //input email
                  TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'email',
                    textInputType: TextInputType.emailAddress,
                  ),

                  //input password
                  TextFieldInput(
                    textEditingController: _passwordController,
                    hintText: 'password',
                    textInputType: TextInputType.text,
                    isPass: true,
                  ),
                ],
              ),

              //confirmation button
              ElevatedButton(
                onPressed: () {
                  AuthMethods()
                      .signInUser(
                    email: _emailController.text,
                    password: _passwordController.text,
                  )
                      .then((result) {
                    handleAuthResult(result, const LandingScreen(), context);
                  });
                },
                child: const Text('Login'),
              ),
            ],
          ),
        ),

        //signup
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Card(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //login with google
                IconButton(
                  onPressed: () {
                    AuthMethods().signInWithGoogle().then((result) {
                      handleAuthResult(result, const LandingScreen(), context);
                    });
                  },
                  icon: const GoogleLogo(height: 50),
                ),
                //login with apple
                IconButton(
                  onPressed: () {
                    AuthMethods().signInWithGoogle().then((result) {
                      handleAuthResult(result, const LandingScreen(), context);
                    });
                  },
                  icon: const AppleLogo(height: 50),
                ),

                //inputs
                Column(
                  children: [
                    //input email
                    TextFieldInput(
                      textEditingController: _emailController,
                      hintText: 'email',
                      textInputType: TextInputType.emailAddress,
                    ),

                    //input password
                    TextFieldInput(
                      textEditingController: _passwordController,
                      hintText: 'password',
                      textInputType: TextInputType.text,
                      isPass: true,
                    ),
                  ],
                ),

                //buttons
                ElevatedButton(
                  onPressed: () {
                    AuthMethods()
                        .signInUser(
                      email: _emailController.text,
                      password: _passwordController.text,
                    )
                        .then((result) {
                      handleAuthResult(result, const LandingScreen(), context);
                    });
                  },
                  child: const Text('Login'),
                ),
              ],
            ),
          ),
        )

        //forgot password
      ],
    );
  }
}
