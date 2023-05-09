import 'package:flutter/material.dart';
import 'package:instagram_flutter/ressources/auth_methods.dart';
import 'package:instagram_flutter/widgets/button.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import 'package:instagram_flutter/utils/logo.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/screens/landing_screen.dart';

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

  void _handleSignIn(String signInResult) {
    if (signInResult == "success") {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LandingScreen()),
      );
    } else {
      // Show an error message or handle the sign-in failure in another way, e.g. using a SnackBar
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(signInResult)),
      );
    }
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

              //spacer
              const SizedBox(
                height: 32,
              ),

              //inputs
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    //input username placeholder
                    const Expanded(child: SizedBox()),

                    //input email
                    Expanded(
                      child: TextFieldInput(
                        textEditingController: _emailController,
                        hintText: 'email',
                        textInputType: TextInputType.emailAddress,
                      ),
                    ),

                    //input password
                    Expanded(
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
                    //login with google
                    GestureDetector(
                      onTap: () {},
                      child: const MyButton(buttonText: 'Login with Google'),
                    ),

                    //login
                    GestureDetector(
                      onTap: () {
                        AuthMethods()
                            .signInUser(
                              email: _emailController.text,
                              password: _passwordController.text,
                            )
                            .then(_handleSignIn);
                      },
                      child: const MyButton(buttonText: 'Login'),
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
                      child: const MyButton(buttonText: 'Signup'),
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
