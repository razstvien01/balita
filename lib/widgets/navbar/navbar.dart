import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/accounts/accounts.dart';
import 'package:news_flight/pages/bookmark/bookmark.dart';
import 'package:news_flight/pages/home/home.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:news_flight/pages/profile/profile.dart';
import 'package:news_flight/pages/signup/components/default_button.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  final user = FirebaseAuth.instance.currentUser;

  List<Widget> widgetOptions() {
    return (user?.email == "admin@gmail.com")
        ? [
            Home(articles: glbArticles),
            Bookmark(bm: bm),
            const Profile(),
            const Accounts(),
          ]
        : [
            Home(articles: glbArticles),
            Bookmark(bm: bm),
            const Profile(),
          ];
  }

  //List of the pages titles
  List<String> titleList = [
    'General',
    'Bookmark',
    'Profile',
    'Manage Accounts'
  ];

  void onTap(int index) {
    setState(() {
      this.index = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    final items = (user?.email == "admin@gmail.com")
        ? <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.bookmark, size: 25),
            Icon(Icons.person, size: 25),
            Icon(Icons.manage_accounts, size: 25)
          ]
        : <Widget>[
            Icon(Icons.home, size: 25),
            Icon(Icons.bookmark, size: 25),
            Icon(Icons.person, size: 25),
          ];

    return Scaffold(
      extendBody: true,
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: kDarkColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              titleList[index],
              style: kHeadTextStyle,
            ),
          ],
        ),
      ),
      bottomNavigationBar: Theme(
        data: Theme.of(context)
            .copyWith(iconTheme: IconThemeData(color: kPrimaryColor)),
        child: CurvedNavigationBar(
          color: kAccentColor,
          backgroundColor: kTransparent,
          items: items,
          index: index,
          height: 60,
          buttonBackgroundColor: kLightColor,
          onTap: onTap,
        ),
      ),
      body: IndexedStack(
        index: index,
        children: widgetOptions(),
      ),
    );
  }
}
