import 'package:news_flight/constant.dart';
import 'package:news_flight/forgot/forgot.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
import 'package:news_flight/signup/components/bottom_widgets.dart';
import 'package:news_flight/signup/components/clear_full_button.dart';
import 'package:news_flight/signup/components/default_button.dart';
import 'package:news_flight/signup/components/default_textfield.dart';
import 'package:news_flight/signup/signup.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: EmptyAppBar(),
      backgroundColor: kDarkColor,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              TopLogo(),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    DefaultTextField(
                      hintText: 'Email Address',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                    SizedBox(
                      height: kFixPadding,
                    ),
                    DefaultTextField(
                      hintText: 'Password',
                      icon: Icons.lock,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: true,
                    ),
                    SizedBox(
                      height: kFixPadding,
                    ),
                    ClearFullButton(
                      whiteText: 'I forgot my ',
                      colorText: 'Password',
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) {
                              return Forgot();
                            },
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              BottomWidgets(
                cfbText1: 'Sign Up',
                cfbText2: 'Don\'t have an account? ',
                btnText: 'Sign In',
                onPressed1: () {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return SignUp();
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
