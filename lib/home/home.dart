import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:news_flight/auth_state_change/auth_state_change.dart';
import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/onboard/onboard.dart';
import 'package:news_flight/signup/components/default_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${user?.email}',
            style: kHeadTextStyle,
          ),
          DefaultButton(
            btnText: 'Sign Out',
            onPressed: FirebaseAuth.instance.signOut,
          ),
        ],
      ),
    );
  }
}
