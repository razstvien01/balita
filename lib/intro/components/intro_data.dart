import 'package:flutter/material.dart';

class IntroData extends StatelessWidget {
  final String introImage, headText, descText;

  const IntroData({
    super.key,
    required this.introImage,
    required this.headText,
    required this.descText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 0,
          child: Stack(
            children: [
              
            ],
          ),
        ),
      ],
    );
  }
}
