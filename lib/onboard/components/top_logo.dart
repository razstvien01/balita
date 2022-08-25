import 'package:balita/constant.dart';
import 'package:flutter/material.dart';

class TopLogo extends StatelessWidget {
  const TopLogo({
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
            Image(
              image: AssetImage(logo),
              height: 180.0,
            ),
            Text(
              'News Flight',
              style: kTitleTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}
