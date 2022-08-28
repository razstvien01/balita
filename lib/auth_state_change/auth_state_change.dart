import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/intro/components/intro_data.dart';
import 'package:news_flight/intro/intro.dart';

class AuthStateChange extends StatefulWidget {
  const AuthStateChange({super.key});

  @override
  State<AuthStateChange> createState() => _AuthStateChangeState();
}

class _AuthStateChangeState extends State<AuthStateChange> {
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
            return Home();
          } else {
            // Navigator.pushAndRemoveUntil('');
            return Intro();
          }
        },
      );
  }
}