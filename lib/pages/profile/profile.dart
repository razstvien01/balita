import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/model/article.dart';
import 'package:news_flight/pages/profile/components/edit_profile.dart';
import 'package:news_flight/pages/signup/components/default_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  final currUser = FirebaseAuth.instance.currentUser;
  Map<String, dynamic> data = {};
  
  //* sign out button
  DefaultButton signOutButton() {
    return DefaultButton(
      btnText: 'Sign Out',
      onPressed: FirebaseAuth.instance.signOut  //* a method that signs out the user from database,
    );
  }
  
  //* Edit button
  IconButton editInfoButton(BuildContext context) {
    return IconButton(
      onPressed: () {
        
        //* navigate
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => EditProfileUI(
                  user: currUser,
                  refresh: () {
                    setState(() {});
                  })),
        );
      },
      icon: Icon(
        Icons.mode_edit_outline_outlined,
        color: Colors.white,
      ),
    );
  }
  
  //* get's the user info
  Widget getUserInfo(context, snapshot) {
          if (snapshot.hasData) {
            data = snapshot.data!.data() as Map<String, dynamic>;
  
            userGlbData = data;
            bmArticles = userGlbData['bookmark'];
            bm = [];
  
            bmArticles.forEach((key, value) {
              ArticleModel article = ArticleModel(
                title: key,
                author: value['author'],
                bookmark: value['bookmark'],
                content: value['content'],
                description: value['description'],
                url: value['url'],
                urlToImage: value['urlToImage'],
              );
  
              bm.add(article);
            });
            return ProfileUI();
          } else {
            return Center(child: CircularProgressIndicator());
          }
        }
  
  //* profile UI
  Container ProfileUI() {
    return Container(
      padding: EdgeInsets.fromLTRB(30.0, 40.0, 30.0, 0.0),
      child: ListView(
        children: [
          Center(
              child: Stack(
            children: [
              Container(
                width: 130,
                height: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 5.0,
                  ),
                  boxShadow: [
                    BoxShadow(
                      spreadRadius: 2,
                      blurRadius: 10,
                      color: Colors.black.withOpacity(0.1),
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
            ],
          )),
          Divider(
            height: 20.0,
          ),
          Text(
            'Username:',
            style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          SizedBox(
            width: double.infinity,
            height: 40.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                data['username'],
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            'Email:',
            style: TextStyle(
              letterSpacing: 2.0,
              color: Colors.white,
            ),
          ),
          SizedBox(height: 10.0),
          SizedBox(
            width: double.infinity,
            height: 40.0,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '${currUser?.email}',
                style: TextStyle(
                  letterSpacing: 1.0,
                  color: Colors.grey,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          SizedBox(height: 10.0),
          signOutButton(),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: kDarkColor,
          elevation: 0.0,
          actions: [
            editInfoButton(context),
          ],
        ),
        backgroundColor: kDarkColor,
        body: FutureBuilder<DocumentSnapshot?>(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc('${currUser?.uid}')
              .get(),
          builder: getUserInfo,
        ));
  }
}
