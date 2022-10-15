import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/signup/components/default_textfield.dart';

class Comment extends StatefulWidget {
  const Comment({super.key});

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<String> comments = [
    'SFHJWSFEsdabwiuwqfhfiosafhsafoifiouf',
    'That is hiiariousdsss',
    'fhf98wfhwe9iudfhuohvvhsedh bg983 nydvnih89yr uovg7fbjdv78g 39',
    ' 87fg 87bv 87 nhgfh 97 uds iol903 ',
  ];

  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kDarkColor,
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Comments',
              style: kHeadTextStyle,
            ),
          ],
        ),
      ),
      backgroundColor: kDarkColor,
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                child: ListView.builder(
                  itemCount: comments.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Text(
                      comments[index],
                      style: TextStyle(color: kPrimaryColor),
                    );
                  },
                ),
              ),
            ),
            TextField(
              controller: _commentController,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              // style: ,
              style: TextStyle(color: kPrimaryColor),
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.add_comment,
                  color: kPrimaryColor,
                ),
                hintText: 'Type your comment here',
                hintStyle: kSmallTextStyle,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50).copyWith(
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(
                    color: kLightColor,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(50).copyWith(
                    bottomRight: Radius.circular(0),
                  ),
                  borderSide: BorderSide(
                    color: kLightColor,
                  ),
                ),

                suffixIcon: Container(
                  margin: EdgeInsets.all(8),
                  
                  child: IconButton(
                    onPressed: () {
                      setState(() {
                        comments.add(_commentController.text);
                        print('comment added');
                        print(_commentController.text);
                        print(comments);
                        // _commentController.dispose();
                        _commentController.clear();
                      });
                    },
                    icon: Icon(
                      Icons.send,
                      color: Colors.amber,
                    ),
                    iconSize: 30,
                    color: kLightColor,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
