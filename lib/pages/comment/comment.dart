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
      body: StreamBuilder<List<Map<String, dynamic>>>(
        // stream: FirebaseFirestore.instance
        //     .collection('comments')
        //     .doc('general')
        //     .get(),
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
            // Map<String, dynamic> data =
            //     snapshot.data!.data() as Map<String, dynamic>;
            // return Text(
            //   data[widget.title].toString(),
            //   style: kSmallTextStyle,
            // );

            // print("asdasdsds");
            // print(getUserTaskLists());

            // snapshot.data

            // int inde = 1;
            // Map m = {};
            // snapshot.data?.forEach((element) {
            //   print(element.toString());
            // });
            // print(widget.title);
            Map n = {};
            snapshot.data?.forEach((element) {
              // print(element);
              // print(element[widget.title]);
              element.forEach((key, value) {
                if (key == "articles") {
                  if (value[widget.title] != null) {
                    comments = value[widget.title];
                        
                    n = value;
                  }
                  // print(comments);
                }
              });
            });

            // if (comments.isEmpty) {
            //   comments = [];
            // }

            // try{
            //   print('First');
            //   List<Map<String, dynamic>>? theData = snapshot.data;
            //   print('First');
            //   Map<String, dynamic> temp2 = theData![0];
            //   comments = temp2[widget.title];
            // }
            // catch(e){
            //   print(e);
            // }
            // print(snapshot.dat);
            // return Text(comments.toString(), style: kSmallTextStyle,);
            // return Text('nothing', style: kSmallTextStyle,);

            // try {
            //   comments = data[widget.title];
            // } catch (e) {
            //   comments = [];
            // }

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
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: Colors.deepPurpleAccent, //<-- SEE HERE
                              ),
                              borderRadius: BorderRadius.circular(kFixPadding),
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
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
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
                                        
                                        SizedBox(width: kLessPadding,),
                                        Text(comments[index]['username'],
                                            style: kHeadTextStyle),
                                      ],
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
                            // if(_commentController.text == '')
                            //   return;
                            
                            if(_commentController.text == '')
                              return;
                            
                            setState(() {
                              // comments.add(_commentController.text);
                              comments.add({
                                'username': userGlbData['username'],
                                'comment': _commentController.text
                              });
                              print("COOOOOOOOOMEEEEEEEEEEEENT");
                              print(comments);
                              _commentController.clear();

                              print(widget.title);

                              String temp = widget.title;

                              // print(m);
                              
                              Map<String, dynamic> newData = snapshot.data![0]['articles'];
                              
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

                            //   FirebaseFirestore.instance
                            //       .collection('social')
                            //       .doc('comments')
                            //       .update(
                            //     {
                            //       'articles': {
                            //         widget.title: comments,
                            //       },
                            //     },
                            //   );
                            // });
                            
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
