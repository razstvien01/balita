import 'package:balita/constant.dart';
import 'package:balita/intro/components/clear_default_button.dart';
import 'package:balita/onboard/onboard.dart';
import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  final int _currentPage;

  const IntroButton({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        (_currentPage == 0 || _currentPage == 1)
            ? ClearDefaultButton(
                name: 'Skip',
                press: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) {
                      return Onboard();
                    }),
                  );
                },
              )
            : ClearDefaultButton(
                name: '',
                press: () {},
              ),
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
          ),
          child: LinearProgressIndicator(
            backgroundColor: kWhiteColor,
            value: (_currentPage + 1) / introData.length,
            valueColor: AlwaysStoppedAnimation<Color>(kPrimaryColor),
          ),
        ),
        (_currentPage == 2)
            ? ClearDefaultButton(
                name: 'Done',
                press: () {},
              )
            : ClearDefaultButton(
                name: '',
                press: () {},
              ),
      ],
    );
  }
}
