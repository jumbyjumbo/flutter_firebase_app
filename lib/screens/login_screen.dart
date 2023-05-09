import 'package:flutter/material.dart';
import 'package:instagram_flutter/ressources/auth_methods.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import 'package:instagram_flutter/utils/logo.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //logo
              const Expanded(
                child: Logo(),
              ),

              //fast login with apple, google and facebook
              // Expanded(
              //   flex: 20,
              //   child: Padding(
              //     padding: const EdgeInsets.all(44.0),
              //     child: Row(
              //       children: [
              //         Expanded(
              //           child: Container(
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.yellow,
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: IconButton(
              //             onPressed: () {
              //               // AuthMethods().signInWithGoogle();
              //             },
              //             style: IconButton.styleFrom(
              //               backgroundColor: primaryColor,
              //               shape: const CircleBorder(),
              //             ),
              //             icon: const ImageIcon(
              //               AssetImage('assets/google_logo.png'),
              //             ),
              //           ),
              //         ),
              //         Expanded(
              //           child: Container(
              //             decoration: const BoxDecoration(
              //               shape: BoxShape.circle,
              //               color: Colors.blue,
              //             ),
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // spacer

              const SizedBox(
                height: 32,
              ),
              //inputs
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //input username
                    Visibility(
                      maintainSize: true,
                      maintainAnimation: true,
                      maintainState: true,
                      visible: false,
                      child: Expanded(
                        flex: 1,
                        child: TextFieldInput(
                          textEditingController: _usernameController,
                          hintText: 'username',
                          textInputType: TextInputType.text,
                        ),
                      ),
                    ),

                    //input email
                    Expanded(
                      flex: 1,
                      child: TextFieldInput(
                        textEditingController: _emailController,
                        hintText: 'email',
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),

                    //input password
                    Expanded(
                      flex: 2,
                      child: TextFieldInput(
                        textEditingController: _passwordController,
                        hintText: 'password',
                        textInputType: TextInputType.text,
                        isPass: true,
                      ),
                    ),
                  ],
                ),
              ),
              //buttons
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //login
                    GestureDetector(
                      onTap: () async {
                        await AuthMethods().signInUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          color: primaryColor,
                        ),
                        child: const Text('login',
                            style: TextStyle(
                                color: mobileBackgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ),
                    ),

                    //signup
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SignupScreen()),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(top: 24),
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        width: double.infinity,
                        alignment: Alignment.center,
                        decoration: const ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(32),
                            ),
                          ),
                          color: primaryColor,
                        ),
                        child: const Text('signup',
                            style: TextStyle(
                                color: mobileBackgroundColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 24)),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
