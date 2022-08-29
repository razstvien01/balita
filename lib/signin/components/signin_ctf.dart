import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/forgot/forgot.dart';
import 'package:news_flight/signup/components/bottom_widgets.dart';
import 'package:news_flight/signup/components/clear_full_button.dart';
import 'package:news_flight/signup/components/default_textfield.dart';

class SignInCTF extends StatelessWidget {
  const SignInCTF({
    super.key,
    required this.formKey,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) : _emailController = emailController, _passwordController = passwordController;

  final GlobalKey<FormState> formKey;
  final TextEditingController _emailController;
  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            DefaultTextField(
              validator: emailValidator,
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
              validator: passwordValidator,
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
      ),
    );
  }
}
