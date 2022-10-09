import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/home/components/arcticle_view.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc, url;

  const BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ArticleView(
              blogUrl: url,
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
                    Image.network(imageUrl),
                    Positioned(
                      top: 10,
                      right: 5,
                      child: Container(
                        height: 50,
                        width: 50,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.bookmark,
                            color: kPrimaryColor,
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
                            color: kPrimaryColor,
                            size: 40,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Text(
                title,
                style: kLightTextStyle,
              ),
              Text(
                desc,
                style: kSmallTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
