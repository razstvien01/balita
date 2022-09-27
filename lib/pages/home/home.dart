import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/model/catergory.dart';
import 'package:news_flight/pages/home/components/blog_tile.dart';
import 'package:news_flight/services/data.dart';
import 'package:news_flight/pages/bookmark/bookmark.dart';
import 'package:news_flight/pages/home/components/category_title.dart';
import 'package:news_flight/pages/intro/components/empty_appbar.dart';
import 'package:news_flight/pages/profile/profile.dart';
import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/pages/signup/components/default_button.dart';
import 'package:news_flight/services/news.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final user = FirebaseAuth.instance.currentUser;
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];

  bool _loading = true;

  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  void getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: kDarkColor,
      body: _loading
          ? Center(
              child: Container(
                child: CircularProgressIndicator(),
              ),
            )
          : Column(
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    child: Container(
                      // color: kAccentColor,
                      padding: EdgeInsets.symmetric(horizontal: kLessPadding),
                      alignment: Alignment.center,
                      child: ListView.builder(
                        itemCount: categories.length,
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        // physics: const BouncingScrollPhysics(),
                        physics: ClampingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return CategoryTile(
                            imageUrl: categories[index].imageUrl,
                            categoryName: categories[index].categoryName,
                          );
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Container(
                      child: ListView.builder(
                        itemCount: articles.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: ((context, index) {
                          return BlogTile(
                            imageUrl: articles[index].urlToImage as String,
                            title: articles[index].title as String,
                            desc: articles[index].description as String,
                            url: articles[index].url as String,
                          );
                        }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
      // : SingleChildScrollView(
      //   // height: MediaQuery.of(context).size.height,

      //   child: Expanded(
      //     child: Container(
      //       height: MediaQuery.of(context).size.height,
      //       child: Column(
      //           children: [
      //             //* Categories
      // Container(
      //   padding: EdgeInsets.symmetric(horizontal: kLessPadding),
      //   alignment: Alignment.topCenter,
      //   child: ListView.builder(
      //     itemCount: categories.length,
      //     scrollDirection: Axis.horizontal,
      //     shrinkWrap: true,
      //     physics: const BouncingScrollPhysics(),
      //     itemBuilder: (context, index) {
      //       return CategoryTile(
      //         imageUrl: categories[index].imageUrl,
      //         categoryName: categories[index].categoryName,
      //       );
      //     },
      //   ),
      // ),

      //             //* Blogs
      //             Container(
      //               child: ListView.builder(
      //                 itemCount: articles.length,
      //                 shrinkWrap: true,
      //                 scrollDirection: Axis.vertical,
      //                 physics: const BouncingScrollPhysics(),
      //                 itemBuilder: ((context, index) {
      //                   return BlogTile(
      //                     imageUrl: articles[index].urlToImage as String,
      //                     title: articles[index].title as String,
      //                     desc: articles[index].description as String,
      //                   );
      //                 }),
      //               ),
      //             ),
      //           ],
      //         ),
      //     ),
      //   ),
      // ),
    );
  }
}
