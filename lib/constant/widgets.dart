import 'dart:math';

import 'package:flutter/cupertino.dart';

import 'colors.dart';

Widget buttonContainer(Decoration boxDecoration, Widget child,double height,double width)
{
  return Container(
    decoration: boxDecoration,
    height: height*.07,
    width: width*.70,

    child: Center(child: child),
  );
}
List<Color> colorsList=[
  genreColor1,
  genreColor2,
  genreColor3,
  genreColor4,
];
int color=Random().nextInt(4);