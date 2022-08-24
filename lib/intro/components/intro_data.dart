import 'package:balita/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
              SvgPicture.asset(
                whiteShape,
                color: kWhiteColor,
                fit: BoxFit.cover,
              ),
              Positioned(
                right: 0,
                left: 0,
                top: 175.0,
                child: Image(
                  image: AssetImage(introImage),
                  height: 150,
                ),
              ),
            ],
          ),
        ),
        Text(
          headText,
          style: kHeadTextStyle,
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.all(kDefaultPadding),
          child: Text(
            descText,
            textAlign: TextAlign.center,
            style: kSubTextStyle,
          ),
        )
      ],
    );
  }
}
