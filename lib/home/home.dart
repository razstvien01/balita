import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/signup/components/default_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: Center(
        child: DefaultButton(
          btnText: 'Sign Out',
          onPressed: FirebaseAuth.instance.signOut,
        ),
      ),
    );
  }
}
