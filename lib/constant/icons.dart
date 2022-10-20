import 'package:flutter/material.dart';

import 'colors.dart';
Icon searchIcon=const Icon(Icons.search,color: blackColor,size: 16,);
Icon closeIcon=const Icon(Icons.close,color: blackColor,size: 16,);
Icon backIcon=const Icon(Icons.arrow_back_ios,color: whiteColor,size: 16,);
Icon videoIcon=const Icon(Icons.play_arrow,color: whiteColor,size: 16,);
Icon notAvailable=Icon(Icons.event_seat_rounded,color: Color(0xffA6A6A680),size: 24,);
Icon regular=Icon(Icons.event_seat_rounded,color: Color(0xff61C3F2),size: 24,);
Icon vip=Icon(Icons.event_seat_rounded,color: Color(0xff564CA3),size: 24,);

icon(Color color)
{
  return Icon(Icons.event_seat_rounded,color: color,size: 24,);
}

Map<String,Icon> iconMap={
"notAvailable":Icon(Icons.event_seat_rounded,color: Color(0xffA6A6A680),size: 12,),
"regular":Icon(Icons.event_seat_rounded,color: Color(0xff61C3F2),size: 12,),
"vip":Icon(Icons.event_seat_rounded,color: Color(0xff564CA3),size: 12,),
"selected":Icon(Icons.event_seat_rounded,color: Color(0xffCD9D0F),size: 12,),
};
// IconData notAvailable=Icons.event_seat_rounded;
// IconData regular=Icons.event_seat_rounded;
// IconData vip=Icons.event_seat_rounded;