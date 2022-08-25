import 'package:balita/constant.dart';
import 'package:flutter/material.dart';

class CenterTagLine extends StatelessWidget {
  const CenterTagLine({
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
            Container(
              padding: EdgeInsets.symmetric(horizontal: 96.0),
              child: Divider(
                color: kPrimaryColor,
                thickness: 1.5,
              ),
            ),
            Text(
              'Presents Factual, and Reliable News Online.',
              style: kSubTextStyle,
            ),
          ],
        ),
      ),
    );
  }
}