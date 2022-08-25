import 'package:balita/constant.dart';
import 'package:balita/intro/components/empty_appbar.dart';
import 'package:balita/intro/components/intro_button.dart';
import 'package:balita/intro/components/intro_data.dart';
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
      backgroundColor: kLightColor,
      appBar: EmptyAppBar(),
      body: Column(
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
      ),
    );
  }
}
