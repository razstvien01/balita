import 'package:flutter/material.dart';

import 'signup/components/default_textfield.dart';

//* Color constants
const kPrimaryColor = Color(0xFFFFFFFF);
const kLightColor = Color(0xFF01B0D3);
const kDarkColor = Color(0xFF242333);
const kAccentColor = Color.fromARGB(255, 98, 95, 138);
const kTransparent = Colors.transparent;

//* Default appbar height
const kAppBarHeight = 56.0;

//* Default round button radius
const kRadius = 0.0;

//* Default padding
const kDefaultPadding = 20.0;
const kLessPadding = 10.0;
const kFixPadding = 16.0;

const kShape = 30.0;

//* images path
const String pieChart = 'assets/images/pieChart.png';
const String trophy = 'assets/images/trophy.png';
const String chat = 'assets/images/chat.png';
const String whiteShape = 'assets/images/whitebg.svg';
const String logo = 'assets/images/logo_nf.png';
const String newspaper = 'assets/images/newspaper.png';

//* Head text style
const kHeadTextStyle = TextStyle(
  fontSize: 24.0,
  fontWeight: FontWeight.bold,
  color: kPrimaryColor,
);

//* Text style constants
const kSubTextStyle = TextStyle(
  fontSize: 18.0,
  color: kPrimaryColor,
);

const kSmallTextStyle = TextStyle(
  fontSize: 16.0,
  color: kPrimaryColor,
);

const kTitleTextStyle = TextStyle(
  fontSize: 22.0,
  color: kPrimaryColor,
);

const kLightTextStyle = TextStyle(
  fontSize: 20.0,
  color: kLightColor
);

//* Intro data map
List<Map<String, String>> introData = [
  {
    'image': newspaper,
    'headText': 'Your daily newspaper',
    'descText':
        "sfjisfoiwesfgjewgoewgosdgndsgogneog goiewogiewoig 0egjewogoiewg",
  },
  {
    'image': trophy,
    'headText': 'Are you informed?',
    'descText':
        "selfgs m erhpkp honoi no[i[go[No ogn[okn ,mvngoib mcval'",
  },
  {
    'image': chat,
    'headText': 'Be nice to each other.',
    'descText': "afjfoiewgjewgojbn ospgjg m opignb oin oigns  osgns",
  },
];

bool introShowOnce = false;