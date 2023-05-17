// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:instagram_flutter/ressources/auth_methods.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import 'package:instagram_flutter/utils/logo.dart';
import 'package:instagram_flutter/screens/signup_screen.dart';
import 'package:instagram_flutter/screens/landing_screen.dart';
import '../utils/default_padding.dart';
import '../utils/google_logo.dart';

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
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //login with google
          ElevatedButton(
            onPressed: () {
              AuthMethods().signInWithGoogle().then((result) {
                handleAuthResult(result, const LandingScreen(), context);
              });
            },
            child: const DefaultPadding(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Login with Google",
                  ),
                  SizedBox(
                    width: 24,
                  ),
                  GoogleLogo(
                    height: 48,
                  ),
                ],
              ),
            ),
          ),
          //inputs
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
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

          //buttons
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //login
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
                child: const DefaultPadding(child: Text('Login')),
              ),
              //signup
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const SignupScreen()),
                  );
                },
                child: const DefaultPadding(child: Text('Signup')),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
