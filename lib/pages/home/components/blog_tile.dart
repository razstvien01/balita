import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/pages/home/components/arcticle_view.dart';

class BlogTile extends StatefulWidget {
  final String imageUrl, title, desc, url;
  final List<ArticleModel> bm;
  final VoidCallback function;

  const BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
    required this.function,
    required this.bm,
  });

  @override
  State<BlogTile> createState() => _BlogTileState();
}

class _BlogTileState extends State<BlogTile> {
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
                                bookmark: false,
                              );
                              
                              setState(() {
                                bmArticles[widget.title] = articleModel;
                                widget.bm.add(articleModel);
                              });
                            } else {
                              setState(() {
                                bmArticles[widget.title] = null;
                                for (int i = 0; i < widget.bm.length; ++i) {
                                  if (widget.bm[i].title == widget.title) {
                                    widget.bm.remove(widget.bm[i]);
                                  }
                                }
                              });
                            }
                            bm = widget.bm;

                            widget.function();
                          },
                          icon: Icon(
                            (bmArticles[widget.title] == null)
                                ? Icons.bookmark_add
                                : Icons.bookmark_added,
                            color: kLightColor,
                            size: 40,
                          ),
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
