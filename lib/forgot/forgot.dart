import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
import 'package:news_flight/signup/components/clear_full_button.dart';
import 'package:news_flight/signup/components/default_button.dart';
import 'package:news_flight/signup/components/default_textfield.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('Password reset link sent! Check your email.'),
          );
        },
      );
      // Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: EmptyAppBar(),
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TopLogo(),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: kDefaultPadding,
                      ),
                      child: Text(
                        'Enter your registered email address. We\'ll send you an email to reset youre password.',
                        style: kSubTextStyle,
                      ),
                    ),
                    SizedBox(
                      height: kDefaultPadding,
                    ),
                    DefaultTextField(
                      validator: emailValidator,
                      controller: _emailController,
                      hintText: 'Email Address',
                      icon: Icons.email,
                      keyboardType: TextInputType.emailAddress,
                      obscureText: false,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ClearFullButton(
                      whiteText: 'Back to ',
                      colorText: 'Sign in',
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    DefaultButton(
                      btnText: 'Submit',
                      onPressed: passwordReset,
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
