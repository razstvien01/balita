import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';

class CategoryTile extends StatelessWidget {
  final String imageUrl, categoryName;

  const CategoryTile({
    super.key,
    required this.imageUrl,
    required this.categoryName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        width: 210,
        alignment: Alignment.topCenter,
        margin: const EdgeInsets.symmetric(horizontal: kLessPadding),
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topCenter,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(kDefaultRadius),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 200,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: kBigPadding),
              alignment: Alignment.topCenter,
              child: Text(
                categoryName,
                style: kCategoryTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
