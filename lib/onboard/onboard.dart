import 'package:news_flight/constant.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/onboard/components/bottom_buttons.dart';
import 'package:news_flight/onboard/components/center_tagline.dart';
import 'package:news_flight/onboard/components/top_logo.dart';
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