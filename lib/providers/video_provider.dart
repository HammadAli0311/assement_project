import 'dart:convert';

import 'package:assemement_test/apis.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class VideoProvider extends ChangeNotifier{
  String videoId="";


  void getVideoId(String movieId) async{
    String id="";
    var response=await http.get(Uri.parse('$allVideosApi$movieId''/videos?api_key=$apikey'));
    var data=jsonDecode(response.body)["results"];

    id=data[0]["key"];
    videoId=id;
    print(videoId);
    notifyListeners();
  }
}