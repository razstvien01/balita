import 'package:another_flushbar/flushbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';


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
  Map<String, dynamic> reports = {};

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
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: FirebaseFirestore.instance
            .collection('social')
            .snapshots()
            .map((event) {
          return event.docs.map((e) {
            // if
            return e.data();
          }).toList();
        }),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            // Map n = {};

            print("Elements");
            snapshot.data![0].forEach((key, value) {
              // print(key);
              // value.forEach((key, value) {
              //     if (key == "articles") {
              if (value[widget.title] != null) {
                comments = value[widget.title];
                // }
              }
              // }
              // );
            });

            // print(comments);

            // snapshot.data![1].forEach((key, value) {
            //   reports[key] = value;
            // });

            snapshot.data![1].forEach((key, value) {
              reports[key] = value;
            });

            return Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                        itemCount: comments.length,
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (context, index) {
                          return Stack(
                            children: [
                              Card(
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    color:
                                        Colors.deepPurpleAccent, //<-- SEE HERE
                                  ),
                                  borderRadius:
                                      BorderRadius.circular(kFixPadding),
                                ),
                                shadowColor: Colors.amber,
                                elevation: 25,
                                margin: EdgeInsets.fromLTRB(10, 10, 10, 0),
                                color: kAccentColor,
                                child: ClipPath(
                                  clipper: ShapeBorderClipper(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(kFixPadding)),
                                  ),
                                  child: Container(
                                    padding: const EdgeInsets.all(kLessPadding),
                                    decoration: BoxDecoration(
                                      border: Border(
                                        left: BorderSide(
                                            color: kLightColor, width: 5),
                                      ),
                                    ),
                                    child: ClipRect(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            child: Row(
                                              children: [
                                                Container(
                                                  width: 50,
                                                  height: 50,
                                                  decoration: BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.white,
                                                      width: 5.0,
                                                    ),
                                                    boxShadow: [
                                                      BoxShadow(
                                                        spreadRadius: 2,
                                                        blurRadius: 10,
                                                        color: Colors.black
                                                            .withOpacity(0.1),
                                                        offset: Offset(0, 10),
                                                      )
                                                    ],
                                                    shape: BoxShape.circle,
                                                    image: DecorationImage(
                                                      fit: BoxFit.cover,
                                                      image: NetworkImage(
                                                          'https://pfpmaker.com/_nuxt/img/profile-3-1.3e702c5.png'),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: kLessPadding,
                                                ),
                                                Text(
                                                  comments[index]['username'],
                                                  style: kHeadTextStyle,
                                                ),
                                                IconButton(
                                                  onPressed: () {
                                                    List uComments = [];
                                                    try {
                                                      uComments = reports[
                                                          comments[index]
                                                              ['username']];
                                                      print(uComments);
                                                    } catch (e) {}

                                                    print(uComments);
                                                    print(
                                                        'reports ----------------');
                                                    print(reports);

                                                    uComments.add(
                                                        comments[index]
                                                            ['comment']);

                                                    Flushbar(
                                                      dismissDirection:
                                                          FlushbarDismissDirection
                                                              .HORIZONTAL,
                                                      flushbarStyle:
                                                          FlushbarStyle
                                                              .FLOATING,
                                                      reverseAnimationCurve:
                                                          Curves.decelerate,
                                                      forwardAnimationCurve:
                                                          Curves.elasticOut,
                                                      flushbarPosition:
                                                          FlushbarPosition.TOP,
                                                      isDismissible: true,
                                                      message:
                                                          '${comments[index]['username']}\'s comment has been reported',
                                                      icon: Icon(
                                                        Icons.info_outline,
                                                        size: 28.0,
                                                        color: Colors.blue[300],
                                                      ),
                                                      duration:
                                                          Duration(seconds: 2),
                                                      leftBarIndicatorColor:
                                                          kLightColor,
                                                    )..show(context);

                                                    FirebaseFirestore.instance
                                                        .collection('social')
                                                        .doc('reports')
                                                        .update({
                                                      comments[index]
                                                              ['username']:
                                                          uComments,
                                                    });
                                                  },
                                                  icon: Icon(
                                                    Icons.report,
                                                    color: Colors.red[300],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 6.0,
                                          ),
                                          Text(
                                            comments[index]['comment'],
                                            style: kSmallTextStyle,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
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
                            if (_commentController.text == '') return;

                            setState(() {
                              comments.add({
                                'username': userGlbData['username'],
                                'comment': _commentController.text
                              });
                              print(comments);
                              _commentController.clear();

                              print(widget.title);

                              String temp = widget.title;

                              Map<String, dynamic> newData =
                                  snapshot.data![0]['articles'];

                              newData[widget.title] = comments;

                              FirebaseFirestore.instance
                                  .collection('social')
                                  .doc('comments')
                                  .update(
                                {
                                  'articles': newData,
                                },
                              );
                            });

                            print('SNAPSHOT');
                            print(snapshot.data![0]['articles']);

                            // Map<String, dynamic> newData = snapshot.data![0]['articles'];
                            // Map<String, dynamic> data = {'articles': comments};
                            // try {
                            //   Map<String, dynamic> newData = snapshot.data![0]['articles'];

                            // newData[widget.title] = comments;
                            // } catch (e) {
                            //   // newData = {
                            //   //   widget.title: comments
                            //   // };
                            // }

                            // FirebaseFirestore.instance
                            //       .collection('social')
                            //       .doc('comments')
                            //       .set(
                            //     newD
                            //   );
                            // });
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
