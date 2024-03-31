import 'package:flutter/material.dart';

String uri = 'http://192.168.110.170:5000';
//import thr ip address


class GlobalVariables {
  // COLORS
  static const appBarGradient = LinearGradient(
    colors: [
      Color.fromARGB(255, 29, 201, 192),
      // Colors.white,
      // Colors.white,

      Color.fromARGB(255, 125, 221, 216),
    ],
    stops: [0.5, 1.0],
  );

  static const secondaryColor = Color.fromRGBO(255, 153, 0, 1);
  static const backgroundColor = Colors.white;
  static const Color greyBackgroundCOlor = Color(0xffebecee);
  static var selectedNavBarColor = Colors.cyan[800]!;
  static const unselectedNavBarColor = Colors.black87;

  static const List<String> carouselImages = [
    'assets/ad.jpeg',
    'assets/ad.jpeg',
    'assets/ad.jpeg',
    'assets/ad.jpeg',

  ];

  static const List<Map<String, String>> categoryImages = [
    {
      'title': 'Cotton',
      'image': 'assets/cotton (1).png',
    },
    {
      'title': 'Wool',
      'image': 'assets/wool.png',
    },
    {
      'title': 'Vegetables',
      'image': 'assets/vegetable.png',
    },

  ];

}