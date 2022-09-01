import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:news_flight/model/catergory.dart';
import 'package:news_flight/model/data.dart';
import 'package:news_flight/pages/bookmark/bookmark.dart';
import 'package:news_flight/pages/home/components/category_title.dart';
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
  final user = FirebaseAuth.instance.currentUser;
  List<CategoryModel> categories = [];

  @override
  void initState() {
    super.initState();
    categories = getCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kDarkColor,
      body: GestureDetector(
        onTap: () {
          
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: kLessPadding),
          alignment: Alignment.topCenter,
          child: ListView.builder(
            itemCount: categories.length,
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return CategoryTile(
                imageUrl: categories[index].imageUrl,
                categoryName: categories[index].categoryName,
              );
            },
          ),
        ),
      ),
    );
  }
}
