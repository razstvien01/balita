import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';

class BlogTile extends StatelessWidget {
  final String imageUrl, title, desc;

  const BlogTile({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
