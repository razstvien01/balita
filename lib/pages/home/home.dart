import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:news_flight/pages/bookmark/bookmark.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:news_flight/pages/profile/profile.dart';
import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/pages/signup/components/default_button.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int index = 0;
  final user = FirebaseAuth.instance.currentUser;

  List<Widget> widgetOptions() {
    return [
      const Home(),
      const Bookmark(),
      const Profile(),
    ];
  }
  
  final items = <Widget>[
    Icon(Icons.home, size: 25),
    Icon(Icons.bookmark, size: 25),
    Icon(Icons.person, size: 25),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kDarkColor,
      appBar: EmptyAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '${user?.email}',
            style: kHeadTextStyle,
          ),
          DefaultButton(
            btnText: 'Sign Out',
            onPressed: FirebaseAuth.instance.signOut,
          ),
        ],
      ),
    );
  }
}
