

import 'package:assemement_test/constant/colors.dart';
import 'package:assemement_test/providers/movie_modal_provider.dart';
import 'package:assemement_test/screen/movie_detail_screen.dart';
import 'package:assemement_test/screen/search_screen.dart';

import 'package:flutter/material.dart';

import 'constant/theme.dart';
import 'package:provider/provider.dart';
void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> MovieProvider()),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: themeColor,
        appBarTheme: AppBarTheme(
         elevation: 0.0,
          color: whiteColor,
        ),

      ),
      home:SearchScreen(),
      routes: {
        MovieDetailScreen.routeName:(context)=>MovieDetailScreen(),
      },
    ),
  ));
}

