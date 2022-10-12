import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/pages/home/components/arcticle_view.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, url;
  final List<ArticleModel> bm;
  final List<ArticleModel> articles;
  final VoidCallback function;
  final int index;
  // late bool isBookmark = false;

  BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
    required this.function,
    required this.bm,
    required this.articles,
    required this.index,
  });

  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
  Icon togggleIcon() {
    bool isAdded = false;
    
    for(int i = 0; i < widget.articles.length; ++i){
      if(widget.articles[i].title == widget.title){
        bool temp = widget.articles[i].bookmark as bool;
        isAdded = widget.articles[i].bookmark = !temp;
      }
    }
    
    
    return Icon(
      (!isAdded == false)
          ? Icons.bookmark_add
          : Icons.bookmark_added,
      color: kLightColor,
      size: 40,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ArticleView(
              blogUrl: widget.url,
            );
          }));
        },
        child: Container(
          margin: EdgeInsets.only(bottom: kDefaultPadding),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                child: Stack(
                  children: [
                    Image.network(widget.imageUrl),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {
                            final user = FirebaseFirestore.instance
                                .collection('users')
                                .doc(
                                    '${FirebaseAuth.instance.currentUser?.uid}');

                            if (bmArticles[widget.title] == null) {
                              ArticleModel articleModel = ArticleModel(
                                title: widget.title,
                                author: '',
                                description: widget.desc,
                                url: widget.url,
                                urlToImage: widget.imageUrl,
                                content: null,
                                bookmark: true,
                              );

                              setState(() {
                                bmArticles[widget.title] = articleModel;
                                widget.bm.add(articleModel);
                                glbArticles[widget.index].bookmark = true;
                              });
                            } else {
                              setState(() {
                                bmArticles[widget.title] = null;
                                for (int i = 0; i < widget.bm.length; ++i) {
                                  if (widget.bm[i].title == widget.title) {
                                    widget.bm.remove(widget.bm[i]);
                                  }
                                }

                                // widget.bm.remove(widget.bm[widget.index]);
                                glbArticles[widget.index].bookmark = false;
                              });
                            }
                            bm = widget.bm;
                            // widget.isBookmark = !widget.isBookmark;

                            print(
                                "Is bookark????? ${glbArticles[widget.index].bookmark}");
                            widget.function();
                          },
                          // icon: Icon(
                          //   (glbArticles[widget.index].bookmark == false)
                          //       ? Icons.bookmark_add
                          //       : Icons.bookmark_added,
                          //   color: kLightColor,
                          //   size: 40,
                          // ),
                          icon: togggleIcon(),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 5,
                      child: Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.comment,
                            color: kLightColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                widget.title,
                style: kLightTextStyle,
              ),
              Text(
                widget.desc,
                style: kSmallTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
