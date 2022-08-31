import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/signup/components/default_textfield.dart';

class SignUpCTF extends StatelessWidget {
  const SignUpCTF({
    super.key,
    required this.formKey,
    required TextEditingController userController,
    required TextEditingController emailController,
    required TextEditingController passwordController1,
    required TextEditingController passwordController2,
  })  : _userController = userController,
        _emailController = emailController,
        _passwordController1 = passwordController1,
        _passwordController2 = passwordController2;

  final GlobalKey<FormState> formKey;
  final TextEditingController _userController;
  final TextEditingController _emailController;
  final TextEditingController _passwordController1;
  final TextEditingController _passwordController2;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            DefaultTextField(
              validator: (value) {
                return null;
              },
              controller: _userController,
              hintText: 'Username',
              icon: Icons.person,
              keyboardType: TextInputType.text,
              obscureText: false,
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
            SizedBox(
              height: kDefaultPadding,
            ),
            DefaultTextField(
              validator: passwordValidator,
              controller: _passwordController1,
              hintText: 'Password',
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            DefaultTextField(
              validator: emailValidator,
              controller: _passwordController2,
              hintText: 'Confirm Password',
              icon: Icons.lock,
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
            ),
          ],
        ),
      ),
    );
  }
}
