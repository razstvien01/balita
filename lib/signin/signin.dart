import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/auth_state_change/auth_state_change.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/forgot/forgot.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/intro/intro.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
import 'package:news_flight/signin/components/signin_ctf.dart';
import 'package:news_flight/signup/components/bottom_widgets.dart';
import 'package:news_flight/signup/components/clear_full_button.dart';
import 'package:news_flight/signup/components/default_textfield.dart';
import 'package:news_flight/signup/signup.dart';
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
    formKey.currentState!.validate();
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      //* IMPORTANTE NI IF MAG LOG IN
      Navigator.of(context).pushNamedAndRemoveUntil('/auth', (route) => false);
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  String? emailValidator(String? value) {
    if (value!.isEmpty ||
        !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]-{2,4}').hasMatch(value)) {
      return 'Enter correct email';
    }
    return null;
  }

  String? validatePassword(value) {
    if (!(value.length > 5) && value.isNotEmpty) {
      return "Password should contain more than 5 characters";
    }
    return null;
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
              Expanded(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // DefaultTextField(
                      //   validator: emailValidator,
                      //   controller: _emailController,
                      //   hintText: 'Email Address',
                      //   icon: Icons.email,
                      //   keyboardType: TextInputType.emailAddress,
                      //   obscureText: false,
                      // ),
                      Container(
                        margin:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        padding:
                            EdgeInsets.symmetric(horizontal: kDefaultPadding),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.all(Radius.circular(kShape)),
                          color: kAccentColor,
                        ),
                        child: TextFormField(
                          validator: emailValidator,
                          // validator: (value) {
                          //   if (value!.isEmpty ||
                          //       !RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]-{2,4}')
                          //           .hasMatch(value)) {
                          //     return 'Enter correct email';
                          //   }
                          //   return null;
                          // },
                          controller: _emailController,
                          cursorColor: kPrimaryColor,
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            hintText: 'Email Address',
                            hintStyle: kSmallTextStyle,
                            iconColor: kPrimaryColor,
                            fillColor: kAccentColor,
                            icon: Icon(
                              Icons.email,
                            ),
                          ),
                          style: kSmallTextStyle,
                          obscureText: false,
                        ),
                      ),
                      SizedBox(
                        height: kFixPadding,
                      ),
                      DefaultTextField(
                        validator: validatePassword,
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
              ),
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
