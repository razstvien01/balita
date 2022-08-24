import 'package:balita/constant.dart';
import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Text(
        'Onboard Page',
        style: kSubTextStyle,
      )),
    );
  }
}
