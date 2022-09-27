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
    return GestureDetector(
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
              child: Image.network(imageUrl),
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
    );
  }
}
