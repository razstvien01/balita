import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/intro/components/clear_default_button.dart';
import 'package:news_flight/pages/onboard/onboard.dart';
import 'package:flutter/material.dart';

class IntroButton extends StatelessWidget {
  //* current page of the pageview list
  final int _currentPage;

  const IntroButton({
    super.key,
    required int currentPage,
  }) : _currentPage = currentPage;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //* if the current page kay page 0 or page 1
        (_currentPage == 0 || _currentPage == 1)
            ? ClearDefaultButton(
                name: 'Skip',
                press: () {
                  Navigator.of(context).pushReplacementNamed(
                    '/onboard'
                  );
                },
              )
            : ClearDefaultButton(
                name: '',
                press: () {},
              ),
        //* Linear progress indicator
        Container(
          width: MediaQuery.of(context).size.width / 1.8,
          padding: EdgeInsets.symmetric(
            vertical: kDefaultPadding,
          ),
          child: LinearProgressIndicator(
            backgroundColor: kLightColor,
            value: (_currentPage + 1) / introData.length,
            valueColor: AlwaysStoppedAnimation<Color>(kDarkColor),
          ),
        ),
        
        //* if current page kay 2
        (_currentPage == 2)
            ? ClearDefaultButton(
                name: 'Done',
                press: () {
                  // Navigator.of(context).push(
                  //   MaterialPageRoute(builder: (context) {
                  //     return Onboard();
                  //   }),
                  // );
                  Navigator.of(context).pushReplacementNamed(
                    '/onboard'
                  );
                },
              )
            : ClearDefaultButton(
                name: '',
                press: () {},
              ),
      ],
    );
  }
}
