import 'package:news_flight/constant.dart';
import 'package:news_flight/signup/components/default_textfield.dart';
import 'package:flutter/material.dart';

class CenterTextFields extends StatelessWidget {
  final _userController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController1 = TextEditingController();
  final _passwordController2 = TextEditingController();
  
  CenterTextFields({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DefaultTextField(
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
            controller:_emailController,
            hintText: 'Email Address',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          DefaultTextField(
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
            controller: _passwordController2,
            hintText: 'Confirm Password',
            icon: Icons.lock,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
        ],
      ),
    );
  }
}
