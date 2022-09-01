import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/home/home.dart';
import 'package:news_flight/pages/intro/intro.dart';
import 'package:news_flight/pages/onboard/onboard.dart';
import 'package:news_flight/widgets/navbar/navbar.dart';

class AuthStateChange extends StatefulWidget {
  const AuthStateChange({super.key});

  @override
  State<AuthStateChange> createState() => _Auth();
}

class _Auth extends State<AuthStateChange> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return Center(child: Text('Something went wrong!'));
        } else if (snapshot.hasData) {
          return NavBar();
        } else {
          if(!introShowOnce){
            introShowOnce = !introShowOnce;
            return Intro();
          }
          else {
            return Onboard();
          }
        }
      },
    );
  }
}
