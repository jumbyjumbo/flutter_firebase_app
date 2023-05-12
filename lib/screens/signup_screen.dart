import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/utils/default_padding.dart';
import 'package:instagram_flutter/utils/logo.dart';
import 'package:instagram_flutter/ressources/auth_methods.dart';
import 'package:instagram_flutter/widgets/text_field_input.dart';
import 'package:instagram_flutter/screens/login_screen.dart';
import 'package:instagram_flutter/screens/landing_screen.dart';
import '../utils/google_logo.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
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
                child: Logo(height: 140),
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
                    //input username
                    Expanded(
                      child: TextFieldInput(
                        textEditingController: _usernameController,
                        hintText: 'username',
                        textInputType: TextInputType.text,
                      ),
                    ),

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
                    ElevatedButton(
                      onPressed: () {
                        AuthMethods().signInWithGoogle().then((result) {
                          handleAuthResult(
                              result, const LandingScreen(), context);
                        });
                      },
                      child: const DefaultPadding(
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Sign up with Google",
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

                    //login
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const LoginScreen()),
                        );
                      },
                      child: const DefaultPadding(child: Text('Login')),
                    ),

                    //signup
                    ElevatedButton(
                      onPressed: () {
                        AuthMethods()
                            .signUpUser(
                          email: _emailController.text,
                          password: _passwordController.text,
                          username: _usernameController.text,
                        )
                            .then((result) {
                          handleAuthResult(
                              result, const LandingScreen(), context);
                        });
                      },
                      child: const DefaultPadding(child: Text('Signup')),
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
