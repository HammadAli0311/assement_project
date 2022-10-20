

import 'package:assemement_test/constant/colors.dart';
import 'package:assemement_test/providers/movie_provider.dart';
import 'package:assemement_test/providers/seat_provider.dart';
import 'package:assemement_test/providers/video_provider.dart';
import 'package:assemement_test/screen/movie_detail_screen.dart';
import 'package:assemement_test/screen/search_screen.dart';
import 'package:assemement_test/screen/seat_mapping_ui.dart';
import 'package:assemement_test/screen/video_player.dart';

import 'package:flutter/material.dart';

import 'constant/theme.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context)=> MovieProvider()),
      ChangeNotifierProvider(create: (context)=>SeatProvider()),
      ChangeNotifierProvider(create: (context)=>VideoProvider()),
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
        SeatMapping.routeName:(context)=>SeatMapping(),
        VideoPlayer.routeName:(context)=>VideoPlayer(),
      },
    ),
  ));
}

