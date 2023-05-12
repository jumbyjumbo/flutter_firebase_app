import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:instagram_flutter/utils/colors.dart';
import 'package:instagram_flutter/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: 'AIzaSyA2KA963ulHew9A6ae9FoOZLkUaqB9uAIg',
            appId: '1:203379764162:web:6aa58fcf29d6e8f25fc45b',
            messagingSenderId: '203379764162',
            projectId: 'instagram-clone-e7137',
            storageBucket: 'instagram-clone-e7137.appspot.com'));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter app',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: backgroundColor,
        useMaterial3: true,
      ),
      // home: const ResponsiveLayout(
      //   mobileLayout: MobileLayout(),
      //   webLayout: WebLayout(),
      // ),
      home: const LoginScreen(),
    );
  }
}
