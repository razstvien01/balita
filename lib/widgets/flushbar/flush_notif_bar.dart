import 'package:flutter/material.dart';
import 'package:another_flushbar/flushbar.dart';

class FlushNotifBar extends StatelessWidget {
  final String title, message;

  const FlushNotifBar({
    super.key,
    required this.title,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Flushbar(
      dismissDirection: FlushbarDismissDirection.HORIZONTAL,
      flushbarPosition: FlushbarPosition.BOTTOM,
      flushbarStyle: FlushbarStyle.FLOATING,
      reverseAnimationCurve: Curves.decelerate,
      forwardAnimationCurve: Curves.elasticOut,
      backgroundColor: Colors.red,
      boxShadows: [
        BoxShadow(
            color: Colors.greenAccent,
            offset: Offset(0.0, 2.0),
            blurRadius: 3.0)
      ],
      backgroundGradient:
          LinearGradient(colors: [Colors.blueGrey, Colors.black]),
      isDismissible: true,
      duration: Duration(seconds: 2),
      icon: Icon(
        Icons.check,
        color: Colors.greenAccent,
      ),
      showProgressIndicator: true,
      progressIndicatorBackgroundColor: Colors.blueGrey,
      titleText: Text(
        title,
        style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.yellow[600],
            fontFamily: "ShadowsIntoLightTwo"),
      ),
      messageText: Text(
        message,
        style: TextStyle(
            fontSize: 18.0,
            color: Colors.green,
            fontFamily: "ShadowsIntoLightTwo"),
      ),
    );
  }
}
