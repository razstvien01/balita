import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';

class OutlinedDefaultButton extends StatelessWidget {
  final VoidCallback press;
  final String btnText;

  const OutlinedDefaultButton({
    super.key,
    required this.press,
    required this.btnText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
      ),
      child: OutlinedButton(
        onPressed: press,
        child: Text(btnText.toUpperCase()),
        style: OutlinedButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: kLessPadding),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(kShape),
          ),
          side: BorderSide(
            color: kLightColor,
            style: BorderStyle.solid,
          ),
          foregroundColor: kPrimaryColor,
        ),
      ),
    );
  }
}
