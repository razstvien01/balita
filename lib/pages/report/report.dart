import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:news_flight/constant.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      body: StreamBuilder<List<Map<String, dynamic>>>(
          stream: FirebaseFirestore.instance
              .collection('social')
              .snapshots()
              .map((event) {
            return event.docs.map((e) {
              return e.data();
            }).toList();
          }),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              Map<String, dynamic> reports = {};

              snapshot.data![1].forEach((key, value) {
                // print('$key : $value');
                // value.forEach((key, value) {
                //     if (key == "articles") {
                // if (value[widget.title] != null) {
                //   comments = value[widget.title];
                //   // }
                // }
                // }
                // );
                reports[key] = value;
              });

              // Queue w = new Queue();

              List<Widget> wid = [];
              print('sdddddddddddddddddddddddddddddddddddddddd');
              print(reports);

              reports.forEach((key, value) {
                List v = value;
                // w.addAll(v);

                // w.forEach((element) {
                //   print(element);
                //   wid.add(
                //     Text('${key}: ${element}', style: kSmallTextStyle,)
                //   );
                // });

                for (int i = v.length - 1; i > 0; --i) {
                  wid.add(
                    Card(
                      // margin: EdgeInsets.
                      shape: RoundedRectangleBorder(
                        // side: BorderSide(
                        //   color: Colors.deepPurpleAccent, //<-- SEE HERE
                        // ),
                        borderRadius: BorderRadius.circular(kFixPadding),
                      ),
                      color: kAccentColor,
                      shadowColor: Colors.amber,
                      elevation: 10,
                      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Text(
                              '${key}: ${v[i]}',
                              style: kSmallTextStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
              });

              // wid.sort()

              return SingleChildScrollView(
                child: Column(
                  children: [
                    Column(children: wid.map((e) => e).toList()),
                    SizedBox(height: 60,),
                  ],
                ),
                physics: BouncingScrollPhysics(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}
