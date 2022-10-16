import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/pages/signup/components/default_textfield.dart';

class Comment extends StatefulWidget {
  final String title;
  const Comment({
    super.key,
    required this.title,
  });

  @override
  State<Comment> createState() => _CommentState();
}

class _CommentState extends State<Comment> {
  List<dynamic> comments = [];

  final _commentController = TextEditingController();

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    // FirebaseFirestore.instance.doc('comment').collection(tit);
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
      body: FutureBuilder<DocumentSnapshot?>(
        future: FirebaseFirestore.instance
            .collection('comments')
            .doc('general')
            .get(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // return Text(
            //   data[widget.title].toString(),
            //   style: kSmallTextStyle,
            // );
            
            try {
              comments = data[widget.title];
            } catch (e) {
              comments = [];
            }
            
            // temp.forEach((key, value) {
            //   comments.add({'username': value['username'], 'comment': value['comment']});
            // });

            return Container(
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
                          return Card(
                            color: kAccentColor,
                            child: Padding(
                              padding: const EdgeInsets.all(kLessPadding),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text((comments[index] as Map)['username'],
                                      style: kHeadTextStyle),
                                  SizedBox(
                                    height: 6.0,
                                  ),
                                  Text(
                                    (comments[index] as Map)['comment'],
                                    style: kSmallTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          );
                          // return Text(
                          //   (comments[index] as Map)['comment'],
                          //   // 'sdssd',
                          //   style: TextStyle(color: kPrimaryColor),
                          // );
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
                              // comments.add(_commentController.text);
                              comments.add({
                                'username': userGlbData['username'],
                                'comment': _commentController.text
                              });

                              print('comment added');
                              print(_commentController.text);
                              print(comments);
                              // _commentController.dispose();
                              _commentController.clear();

                              FirebaseFirestore.instance
                                  .collection('comments')
                                  .doc('general')
                                  .update({
                                '${widget.title}': comments,
                              });

                              // final user = FirebaseFirestore.instance
                              //         .collection('users')
                              //         .doc(
                              //             '${FirebaseAuth.instance.currentUser?.uid}');
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
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      // body: Container(
      //   height: MediaQuery.of(context).size.height,
      //   child: Column(
      //     // crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //       Expanded(
      //         child: Container(
      //           child: ListView.builder(
      //             itemCount: comments.length,
      //             scrollDirection: Axis.vertical,
      //             shrinkWrap: true,
      //             physics: const BouncingScrollPhysics(),
      //             itemBuilder: (context, index) {
      //               return Card(
      //                 color: kAccentColor,
      //                 child: Padding(
      //                   padding: const EdgeInsets.all(kLessPadding),
      //                   child: Column(
      //                     crossAxisAlignment: CrossAxisAlignment.start,
      //                     children: [
      //                       Text((comments[index] as Map)['username'],
      //                           style: kHeadTextStyle),
      //                       SizedBox(
      //                         height: 6.0,
      //                       ),
      //                       Text(
      //                         (comments[index] as Map)['comment'],
      //                         style: kSmallTextStyle,
      //                       ),
      //                     ],
      //                   ),
      //                 ),
      //               );
      //               // return Text(
      //               //   (comments[index] as Map)['comment'],
      //               //   // 'sdssd',
      //               //   style: TextStyle(color: kPrimaryColor),
      //               // );
      //             },
      //           ),
      //         ),
      //       ),
      //       TextField(
      //         controller: _commentController,
      //         textInputAction: TextInputAction.done,
      //         keyboardType: TextInputType.text,
      //         // style: ,
      //         style: TextStyle(color: kPrimaryColor),
      //         decoration: InputDecoration(
      //           prefixIcon: Icon(
      //             Icons.add_comment,
      //             color: kPrimaryColor,
      //           ),
      //           hintText: 'Type your comment here',
      //           hintStyle: kSmallTextStyle,
      //           enabledBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(50).copyWith(
      //               bottomRight: Radius.circular(0),
      //             ),
      //             borderSide: BorderSide(
      //               color: kLightColor,
      //             ),
      //           ),
      //           focusedBorder: OutlineInputBorder(
      //             borderRadius: BorderRadius.circular(50).copyWith(
      //               bottomRight: Radius.circular(0),
      //             ),
      //             borderSide: BorderSide(
      //               color: kLightColor,
      //             ),
      //           ),
      //           suffixIcon: Container(
      //             margin: EdgeInsets.all(8),
      //             child: IconButton(
      //               onPressed: () {
      //                 setState(() {
      //                   // comments.add(_commentController.text);
      //                   comments.add({
      //                     'username': userGlbData['username'],
      //                     'comment': _commentController.text
      //                   });

      //                   print('comment added');
      //                   print(_commentController.text);
      //                   print(comments);
      //                   // _commentController.dispose();
      //                   _commentController.clear();

      //                   FirebaseFirestore.instance.collection('comments').doc('general').update({
      //                     '${widget.title}': comments,
      //                   });

      //                   // final user = FirebaseFirestore.instance
      //                   //         .collection('users')
      //                   //         .doc(
      //                   //             '${FirebaseAuth.instance.currentUser?.uid}');
      //                 });
      //               },
      //               icon: Icon(
      //                 Icons.send,
      //                 color: Colors.amber,
      //               ),
      //               iconSize: 30,
      //               color: kLightColor,
      //             ),
      //           ),
      //         ),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
