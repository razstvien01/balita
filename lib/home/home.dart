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
  
  final FirebaseAuth auth = FirebaseAuth.instance;
  //signout function 
  signOut() async {
    await auth.signOut();
    // Navigator.pushReplacement(
    //     context, MaterialPageRoute(builder: (context) => AuthStateChange()));
    Navigator.of(context).popAndPushNamed('/auth');
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: Center(
        child: DefaultButton(
          btnText: 'Sign Out',
          onPressed: signOut,
        ),
      ),
    );
  }
}
