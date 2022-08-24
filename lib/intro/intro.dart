import 'package:balita/constant.dart';
import 'package:balita/intro/components/empty_appbar.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  const Intro({super.key});

  @override
  State<Intro> createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kAccentColor,
      appBar: EmptyAppBar(),
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              itemCount: introData.length,
              itemBuilder: (context, index){
                return Text('');
              },
            ),
          ),
        ],
      ),
    );
  }
}