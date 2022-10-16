import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_flight/constant.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/pages/home/components/blog_tile.dart';

class Bookmark extends StatefulWidget {
  final List<ArticleModel> bm;
  const Bookmark({super.key, required this.bm});

  @override
  State<Bookmark> createState() => _BookmarkState();
}

class _BookmarkState extends State<Bookmark> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: (!userGlbData['enable'])
          ? Center(
              child: Text(
                'Account disabled',
                style: kTitleTextStyle,
              ),
            )
          : (bm.isEmpty)
              ? Center(
                  child: Text('No Articles Saved', style: kSubTextStyle),
                )
              // : Text('Pota', style: kSubTextStyle,)
              : SingleChildScrollView(
                  child: Column(
                    children: [
                      ListView.builder(
                        itemCount: widget.bm.length,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return BlogTile(
                            imageUrl: widget.bm[index].urlToImage as String,
                            title: widget.bm[index].title as String,
                            desc: widget.bm[index].description as String,
                            url: widget.bm[index].url as String,
                            bm: widget.bm,
                            articles: glbArticles,
                            function: () {
                              setState(() {});
                            },
                            index: index,
                            isBookmark: widget.bm[index].bookmark as bool,
                          );
                        },
                      ),
                    ],
                  ),
                ),
    );
  }
}
