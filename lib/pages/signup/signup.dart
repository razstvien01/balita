import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/home/home.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:news_flight/pages/onboard/components/top_logo.dart';
import 'package:news_flight/pages/signin/signin.dart';
import 'package:news_flight/pages/signup/components/bottom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/pages/signup/components/signup_ctf.dart';

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

  //* Function nga mag sign up sa accout details sa databse
  Future signUp() async {
    formKey.currentState!.validate();
    if (_passwordController1.text.trim() == _passwordController2.text.trim()) {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController1.text.trim(),
      );

      //* Add user detail
      await addUserDetails(_userController.text.trim(), _emailController.text.trim());
      
      //* IMPORTANTE NI IF MAG LOG IN - if ma successful ang sign up mo navigate siya sa auth.dart nya muadto sa home page
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    }
  }
  
  //* function nga mo add sa sa account details padung sa firebase database
  Future addUserDetails(String username, String email) async {
    final currentUser = FirebaseAuth.instance.currentUser;
    
    final docUser = FirebaseFirestore.instance.collection('users').doc(currentUser?.uid);
    
    await docUser.set({
      'username': username,
      'email': email,
      'enable': true,
      'bookmark': {},
    });
  }
  
  //* UI
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
                  Navigator.of(context).pushReplacementNamed('/onboard/signin');  
                },
                onPressed2: signUp,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
