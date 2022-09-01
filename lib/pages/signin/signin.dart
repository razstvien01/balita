import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:news_flight/pages/onboard/components/top_logo.dart';
import 'package:news_flight/pages/signin/components/signin_ctf.dart';
import 'package:news_flight/pages/signup/components/bottom_widgets.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  Future signIn() async {
    
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //* IMPORTANTE NI IF MAG LOG IN
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
      formKey.currentState!.validate();
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
  
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
              // SigninCTF(emailController: _emailController, passwordController: _passwordController),
              SignInCTF(formKey: formKey, emailController: _emailController, passwordController: _passwordController),
              BottomWidgets(
                cfbText1: 'Sign Up',
                cfbText2: 'Don\'t have an account? ',
                btnText: 'Sign In',
                onPressed1: () {
                  // Navigator.push(context, MaterialPageRoute(
                  //   builder: (context) {
                  //     return SignUp();
                  //   },
                  //                  ));
                  
                  Navigator.of(context).pushReplacementNamed('/onboard/signup');
                },
                onPressed2: signIn,
              ),
            ],
          ),
        ),
      ),
    );
  }
}