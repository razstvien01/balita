import 'package:balita/constant.dart';
import 'package:balita/intro/components/empty_appbar.dart';
import 'package:balita/onboard/components/bottom_buttons.dart';
import 'package:balita/onboard/components/center_tagline.dart';
import 'package:balita/onboard/components/top_logo.dart';
import 'package:flutter/material.dart';

class Onboard extends StatelessWidget {
  const Onboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          TopLogo(),
          CenterTagLine(),
          BottomButtons(),
        ],
      ),
    );
  }
}