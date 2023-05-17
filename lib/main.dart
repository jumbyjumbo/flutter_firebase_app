import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:instagram_flutter/screens/landing_screen.dart';
import 'package:instagram_flutter/utils/colors.dart';

//initialise firebase and run the app
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

  // root of the app
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      //make the theme dark or light depending on system settings
      themeMode: ThemeMode.system,

      //general animation duration
      themeAnimationDuration: const Duration(milliseconds: 200),

      //hide test banner
      debugShowCheckedModeBanner: false,

      //title of the app used by the OS
      title: 'flutter app',

      //theme of the app
      theme: ThemeData(
        //card theme
        cardTheme: const CardTheme(color: deepgrey),
        //elevated button style
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: buttongrey,
            foregroundColor: white,
          ),
        ),
        //app font
        textTheme: GoogleFonts.orbitronTextTheme(textTheme),
        useMaterial3: true,
        primaryColor: white,
        canvasColor: deepergrey,
        scaffoldBackgroundColor: deepergrey,
      ),

      // home: const ResponsiveLayout(
      //   mobileLayout: MobileLayout(),
      //   webLayout: WebLayout(),
      // ),
      home: const LandingScreen(),
    );
  }
}
