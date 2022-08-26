import 'package:balita/home/home.dart';
import 'package:balita/signin/signin.dart';
import 'package:balita/signup/components/clear_full_button.dart';
import 'package:balita/signup/components/default_button.dart';
import 'package:flutter/material.dart';

class BottomWidgets extends StatelessWidget {
  const BottomWidgets({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClearFullButton(
            colorText: 'Sign In',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return SignIn();
                },
              ));
            },
            whiteText: 'Already have an account? ',
          ),
          DefaultButton(
            btnText: 'Sign Up',
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return Home();
                },
              ));
            },
          ),
        ],
      ),
    );
  }
}
