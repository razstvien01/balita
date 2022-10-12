import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';

class GetUserInfo extends StatefulWidget {
  final String documentId;

  const GetUserInfo({
    super.key,
    required this.documentId,
  });

  @override
  State<GetUserInfo> createState() => _GetUserInfoState();
}

class _GetUserInfoState extends State<GetUserInfo> {
  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(widget.documentId).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Column(
            children: [
              Text(
                'Username: ${data['username']}',
                style: TextStyle(color: kPrimaryColor),
              ),
              Text(
                'Email: ${data['email']}',
                style: TextStyle(color: kPrimaryColor),
              ),
              IconButton(
                onPressed: () {
                  setState(() {
                    FirebaseFirestore.instance
                        .collection('users')
                        .doc(widget.documentId)
                        .update({
                      'enable': !data['enable'],
                    });
                  });
                },
                icon: Icon(
                  (!data['enable'])
                      ? Icons.no_accounts
                      : Icons.account_circle,
                  color: kPrimaryColor,
                ),
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
