import 'package:balita/constant.dart';
import 'package:balita/intro/components/empty_appbar.dart';
import 'package:balita/onboard/components/top_logo.dart';
import 'package:flutter/material.dart';

class Forgot extends StatefulWidget {
  const Forgot({super.key});

  @override
  State<Forgot> createState() => _ForgotState();
}

class _ForgotState extends State<Forgot> {
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
            ],
          ),
        ),
      ),
    );
  }
}