import 'package:firebase_core/firebase_core.dart';
import 'package:news_flight/auth_state_change/auth_state_change.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/firebase_options.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_flight/onboard/onboard.dart';
import 'package:news_flight/signin/signin.dart';
import 'package:news_flight/signup/signup.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  
  // await Firebase.initializeApp();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  
  //* Setting statusbarcolor to kTransparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kTransparent,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news_flight',
      
      //* Removing the debug banner
      debugShowCheckedModeBanner: false,
      
      //* Setting up themedata of the app
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary:  kDarkColor
        ),
        highlightColor: kTransparent,
        fontFamily: 'Jaapokki',
      ),
      home: AuthStateChange(),
      
      routes: {
        '/intro': (context) => const Intro(),
        '/auth': (context) => const AuthStateChange(),
        '/onboard': (context) => const Onboard(),
        '/onboard/signin': (context) => const SignIn(),
        '/onboard/signup': (context) => const SignUp(),
        '/home': (context) => const Home(),
      },
    );
  }
}
