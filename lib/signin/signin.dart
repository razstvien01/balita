import 'package:balita/constant.dart';
import 'package:balita/forgot/forgot.dart';
import 'package:balita/home/home.dart';
import 'package:balita/intro/components/empty_appbar.dart';
import 'package:balita/onboard/components/top_logo.dart';
import 'package:balita/signup/components/clear_full_button.dart';
import 'package:balita/signup/components/default_button.dart';
import 'package:balita/signup/components/default_textfield.dart';
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
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClearFullButton(
                      whiteText: 'Don\'t have an account? ',
                      colorText: 'Sign Up',
                      onPressed: () {},
                    ),
                    DefaultButton(
                      btnText: 'Sign In',
                      onPressed: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
