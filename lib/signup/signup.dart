import 'package:news_flight/constant.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
import 'package:news_flight/signin/signin.dart';
import 'package:news_flight/signup/components/bottom_widgets.dart';
import 'package:news_flight/signup/components/center_textfields.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopLogo(),
              CenterTextFields(),
              BottomWidgets(
                btnText: 'Sign Up',
                cfbText1: 'Sign In',
                cfbText2: 'Already have an account? ',
                onPressed1: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignIn();
                    },
                  ));
                },
                onPressed2: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return Home();
                    },
                  ));
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
