import 'package:news_flight/constant.dart';
import 'package:news_flight/intro/intro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  //* Setting statusbarcolor to kTransparent
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: kTransparent,
    )
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'news_flight',
      
      //* Removing the debug banner
      debugShowCheckedModeBanner: false,
      
      //* Setting up themedata of the app
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary:  kDarkColor
        ),
        highlightColor: kTransparent,
        fontFamily: 'Jaapokki',
      ),
      home: Intro(),
    );
  }
}
