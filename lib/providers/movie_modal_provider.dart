import 'dart:convert';

import 'package:assemement_test/apis.dart';
import 'package:flutter/material.dart';

import '../model/movie_model.dart';
import 'package:http/http.dart' as http;


class MovieProvider extends ChangeNotifier{
  List<MovieModel> allMovies=[];
  bool wait=false;


  void getMovies() async
  {
    wait=true;
    var response=await http.get(Uri.parse(moviesApi));
    var data=jsonDecode(response.body)["results"];
    data.forEach((element)=>allMovies.add(MovieModel(title: element["original_title"], id: element["id"], overview: element["overview"], backdropPath: element["backdrop_path"], posterPath: element["poster_path"])));
    wait=false;
    notifyListeners();
  }
}