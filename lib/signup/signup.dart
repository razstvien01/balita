import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
import 'package:news_flight/signin/signin.dart';
import 'package:news_flight/signup/components/bottom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/signup/components/signup_ctf.dart';

import 'components/default_textfield.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //* Text Controllers
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _userController.dispose();
    _emailController.dispose();
    _passwordController1.dispose();
    _passwordController2.dispose();
    super.dispose();
  }

  Future signUp() async {
    formKey.currentState!.validate();
    if (_passwordController1.text.trim() == _passwordController2.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController1.text.trim(),
      );
      //* IMPORTANTE NI IF MAG LOG IN
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height * 1.268,
          child: Column(
            children: [
              TopLogo(),
              // CenterTextFields(),
              // SignupCTF(
              //   formKey: formKey,
              //   userController: _userController,
              //   emailController: _emailController,
              //   passwordController1: _passwordController1,
              //   passwordController2: _passwordController2,
              // ),
              SignUpCTF(
                formKey: formKey,
                userController: _userController,
                emailController: _emailController,
                passwordController1: _passwordController1,
                passwordController2: _passwordController2,
              ),
              BottomWidgets(
                btnText: 'Sign Up',
                cfbText1: 'Sign In',
                cfbText2: 'Already have an account? ',
                onPressed1: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return SignIn();
                  //   },
                  // ));
                  Navigator.of(context).pushReplacementNamed('/onboard/signin');
                },
                // onPressed2: () {
                //   Navigator.push(context, MaterialPageRoute(
                //     builder: (context) {
                //       return Home();
                //     },
                //   ));
                // },
                onPressed2: signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}