import 'package:firebase_auth/firebase_auth.dart';
import 'package:news_flight/constant.dart';
import 'package:news_flight/home/home.dart';
import 'package:news_flight/intro/components/empty_appbar.dart';
import 'package:news_flight/intro/components/intro_button.dart';
import 'package:news_flight/intro/components/intro_data.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  //* Page controller
  var _controller = PageController();

  //* current page variable
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    _controller.addListener(() {
      setState(() {
        _currentPage = _controller.page?.round() as int;
      });
    });

    return Scaffold(
      backgroundColor: kAccentColor,
      appBar: EmptyAppBar(),
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (snapshot.hasError) {
            return Center(child: Text('Something went wrong!'));
          } else if (snapshot.hasData) {
            return Home();
          } else {
            return Column(
              children: [
                Expanded(
                  //* View page list
                  child: PageView.builder(
                    itemCount: introData.length,
                    itemBuilder: (context, index) {
                      //* Returns intro data info
                      return IntroData(
                        introImage: introData[index]['image'] as String,
                        headText: introData[index]['headText'] as String,
                        descText: introData[index]['descText'] as String,
                      );
                    },
                    onPageChanged: (page) {
                      setState(() {
                        _currentPage = page;
                      });
                    },
                  ),
                ),
                IntroButton(
                  currentPage: _currentPage,
                ),
              ],
            );
          }
        },
      ),
    );
  }
}
