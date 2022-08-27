import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/forgot/forgot.dart';
import 'package:news_flight/signup/components/clear_full_button.dart';
import 'package:news_flight/signup/components/default_textfield.dart';

class SignInCTF extends StatelessWidget {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  
  Future signIn() async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );
  }
  
  SignInCTF({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextField(
            controller: _emailController,
            hintText: 'Email Address',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(
            height: kFixPadding,
          ),
          DefaultTextField(
            controller: _passwordController,
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
    );
  }
}
