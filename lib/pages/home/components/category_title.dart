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
      onTap: () {
        
      },
      child: Container(
        width: 210,
        alignment: Alignment.topLeft,
        margin: const EdgeInsets.symmetric(horizontal: kLessPadding),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.0),
              child: Image.network(
                imageUrl,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 45),
              alignment: Alignment.topCenter,
              child: Text(categoryName, style: kCategoryTextStyle),
            ),
            
            // Positioned(
            //   top: 10,
            //   right: 20,
            //   child: Container(
            //     height: 50,
            //     width: 50,
            //     child: IconButton(
            //       onPressed: () {},
            //       icon: Icon(
            //         Icons.bookmark_add,
            //         color: kPrimaryColor,
            //       ),
            //       iconSize: 30,
            //     ),
            //     decoration: BoxDecoration(
            //       color: kAccentColor,
            //       borderRadius: BorderRadius.circular(50),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
