import 'package:flutter/material.dart';

class AppColors {
  static const colorFC9D11 = Color(0xfffc9d11);
  static const colorA4957E = Color(0xffa4957e);
  static const color232220 = Color(0xff232220);
  static const color2B2B2B = Color(0xff2b2b2b);
  static const colorWhite = Colors.white;
  static const List<Color> homeColorsGradient = [
    Color(0xFFFDF7ED),
    Color(0xFFFED9A4),
    Color(0xFFFDC28B),
  ];

  static const List<Color> cataloColorsGradient = [
    colorWhite,
    colorWhite,
    colorWhite,
    ...homeColorsGradient,
  ];

  static const List<Color> headerAvatarGradient = [
    colorFC9D11,
    colorFC9D11,
    Color(0xFFFDC28B),
    Color(0xFFFDC28B),
  ];

 static  List<Color> layerMenuGradient =   [Colors.white, Colors.grey.shade300];
}
