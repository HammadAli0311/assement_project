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
Map<int,TableColumnWidth> columnWidth={
0:FlexColumnWidth(3),
1:FlexColumnWidth(3),
2:FlexColumnWidth(2),
3:FlexColumnWidth(2),
4:FlexColumnWidth(2),
5:FlexColumnWidth(2),
6:FlexColumnWidth(3),
7:FlexColumnWidth(2),
8:FlexColumnWidth(2),
9:FlexColumnWidth(2),
10:FlexColumnWidth(2),
11:FlexColumnWidth(2),
12:FlexColumnWidth(2),
13:FlexColumnWidth(2),
14:FlexColumnWidth(2),
15:FlexColumnWidth(2),
16:FlexColumnWidth(2),
17:FlexColumnWidth(2),
18:FlexColumnWidth(2),
19:FlexColumnWidth(2),
20:FlexColumnWidth(2),
21:FlexColumnWidth(3),
22:FlexColumnWidth(2),
23:FlexColumnWidth(2),
24:FlexColumnWidth(2),
25:FlexColumnWidth(2),
26:FlexColumnWidth(2),
27:FlexColumnWidth(2),
};