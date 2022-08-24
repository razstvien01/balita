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
  var _controller = PageController();
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
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: introData.length,
              itemBuilder: (context, index) {
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
