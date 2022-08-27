import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String hintText;
  final IconData icon;
  final TextEditingController controller;
  final keyboardType, obscureText;

  const DefaultTextField({
    super.key,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.keyboardType,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(kShape)),
        color: kAccentColor,
      ),
      child: TextField(
        controller: controller,
        cursorColor: kPrimaryColor,
        textInputAction: TextInputAction.next,
        keyboardType: keyboardType,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: kSmallTextStyle,
          iconColor: kPrimaryColor,
          fillColor: kAccentColor,
          icon: Icon(
            icon,
          ),
        ),
        style: kSmallTextStyle,
        obscureText: obscureText,
      ),
    );
  }
}
