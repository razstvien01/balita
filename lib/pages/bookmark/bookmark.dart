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
  // void bmButton() {
  //   final user = FirebaseFirestore.instance
  //       .collection('users')
  //       .doc('${FirebaseAuth.instance.currentUser?.uid}');

  //   if (bmArticles[widget.title] == null) {
  //     ArticleModel articleModel = ArticleModel(
  //       title: widget.title,
  //       author: '',
  //       description: widget.desc,
  //       url: widget.url,
  //       urlToImage: widget.imageUrl,
  //       content: null,
  //       bookmark: false,
  //     );

  //     // bmArticles[widget.title] = {
  //     //   'desc': widget.desc,
  //     //   'imageUrl': widget.imageUrl,
  //     //   'url': widget.url,
  //     // };
  //     // print("ADDED");

  //     setState(() {
  //       bmArticles[widget.title] = articleModel;
  //       widget.bm.add(articleModel);
  //     });
  //     // bmArticles.forEach((key, value) {
  //     //   bm.add(value);

  //     // });
  //   } else {
  //     // ArticleModel articleModel = ArticleModel(
  //     //   title: widget.title,
  //     //   author: '',
  //     //   description: widget.desc,
  //     //   url: widget.url,
  //     //   urlToImage: widget.imageUrl,
  //     //   content: null,
  //     //   bookmark: false,

  //     // );

  //     setState(() {
  //       bmArticles[widget.title] = null;
  //       // bm.remove();
  //       for (int i = 0; i < widget.bm.length; ++i) {
  //         if (widget.bm[i].title == widget.title) {
  //           widget.bm.remove(widget.bm[i]);
  //         }
  //       }
  //     });

      // bmArticles[widget.title] = null;
      // // bm.remove();
      // for (int i = 0; i < widget.bm.length; ++i) {
      //   if (widget.bm[i].title == widget.title) {
      //     widget.bm.remove(widget.bm[i]);
      //   }
      // }
    // }

    // if(bmArticles.isNotEmpty){
    //   bmArticles.forEach((key, value) {
    //     bm.add(value);
    //   });
    // }
    // else
    //   bm = [];
    // }
  //   bm = widget.bm;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: (bm.isEmpty)
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
                        function: (){
                          setState(() {
                            
                          });
                        },
                        index: index,
                      );
                    },
                  ),
                ],
              ),
            ),
    );
  }
}
