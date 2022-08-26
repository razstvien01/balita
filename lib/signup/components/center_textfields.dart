import 'package:balita/constant.dart';
import 'package:balita/signup/components/default_textfield.dart';
import 'package:flutter/material.dart';

class CenterTextFields extends StatelessWidget {
  const CenterTextFields({
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
            hintText: 'Username',
            icon: Icons.person,
            keyboardType: TextInputType.text,
            obscureText: false,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          DefaultTextField(
            hintText: 'Email Address',
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            obscureText: false,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          DefaultTextField(
            hintText: 'Password',
            icon: Icons.lock,
            keyboardType: TextInputType.visiblePassword,
            obscureText: true,
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          DefaultTextField(
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
