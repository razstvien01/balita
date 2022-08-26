import 'package:news_flight/constant.dart';
import 'package:news_flight/onboard/components/outlined_default_button.dart';
import 'package:news_flight/signin/signin.dart';
import 'package:news_flight/signup/signup.dart';
import 'package:flutter/material.dart';

class BottomButtons extends StatelessWidget {
  const BottomButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedDefaultButton(
              press: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignUp();
                }));
              },
              btnText: 'Sign Up',
            ),
            SizedBox(
              height: kDefaultPadding,
            ),
            OutlinedDefaultButton(
              press: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignIn();
                }));
              },
              btnText: 'Sign in',
            ),
          ],
        ),
      ),
    );
  }
}
