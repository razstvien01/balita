import 'package:balita/constant.dart';
import 'package:flutter/material.dart';

class ClearDefaultButton extends StatelessWidget {
  final VoidCallback press;
  final String name;

  const ClearDefaultButton({
    super.key,
    required this.name,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: TextButton(
          onPressed: press,
          child: Text(
            name.toUpperCase(),
            style: TextStyle(
              color: kPrimaryColor,
            ),
          ),
          ),
    );
  }
}
