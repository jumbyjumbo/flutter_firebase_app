import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import '../../ressources/auth_methods.dart';
import '../../widgets/continue_with_3rd_party.dart';
import '../../widgets/text_field_input.dart';
import '../landing_screen.dart';

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
        //signup
        Column(
          children: [
            //signup title
            const SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Signup',
                  style: TextStyle(
                      fontSize: 60, color: white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const Spacer(),

            //inputs
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                children: [
                  //input username
                  TextFieldInput(
                    textEditingController: _usernameController,
                    hintText: 'username',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  //input email
                  TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
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
            ),
            const SizedBox(
              height: 50,
            ),

            //signup button
            GestureDetector(
              onTap: () {
                AuthMethods()
                    .signUpUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                  username: _usernameController.text,
                )
                    .then((result) {
                  handleAuthResult(result, const LandingScreen(), context);
                });
              },
              child: const SizedBox(
                height: 80,
                width: double.infinity,
                child: Card(
                  color: white,
                  child: Center(
                    child: Text(
                      'Signup',
                      style: TextStyle(
                          fontSize: 30,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),

            //continue with 3rd party
            const ContinueWith3rdParty(), //already have an account? Login

            //already have an account? Signup
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Already have an account?",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16)),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  child: const Text("Login",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ],
            )
          ],
        ),

        //login
        Column(
          children: [
            //login title
            const SizedBox(
              height: 80,
              child: Center(
                child: Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 60, color: white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            //inputs
            const Spacer(),
            Padding(
              padding: const EdgeInsets.fromLTRB(12, 0, 12, 0),
              child: Column(
                children: [
                  //input email
                  TextFieldInput(
                    textEditingController: _emailController,
                    hintText: 'email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(
                    height: 10,
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
            ),

            //forgot password
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
              child: Container(
                alignment: Alignment.centerRight,
                child: GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(2,
                        duration: const Duration(milliseconds: 500),
                        curve: Curves.ease);
                  },
                  child: const Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: white,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 50,
            ),
            //login button
            GestureDetector(
              onTap: () {
                AuthMethods()
                    .signInUser(
                  email: _emailController.text,
                  password: _passwordController.text,
                )
                    .then((result) {
                  handleAuthResult(result, const LandingScreen(), context);
                });
              },
              child: const SizedBox(
                height: 80,
                width: double.infinity,
                child: Card(
                  color: white,
                  child: Center(
                    child: Text(
                      'Login',
                      style: TextStyle(
                          fontSize: 30,
                          color: black,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            //continue with 3rd party
            const ContinueWith3rdParty(), //dont have an account? signup

            //dont have an account? login
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Don't have an account?",
                  style: TextStyle(
                      color: white, fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(
                  width: 8,
                ),
                GestureDetector(
                  onTap: () {
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 200),
                        curve: Curves.ease);
                  },
                  child: const Text("Signup",
                      style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                          fontSize: 16)),
                ),
              ],
            )
          ],
        ),

        //forgot password TODO #6
      ],
    );
  }
}
