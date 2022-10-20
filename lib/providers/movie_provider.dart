import 'dart:convert';

import 'package:assemement_test/apis.dart';
import 'package:flutter/material.dart';

import '../model/movie_model.dart';
import 'package:http/http.dart' as http;


class MovieProvider extends ChangeNotifier{
  List<MovieModel> allMovies=[];
  List<String> genres=[];
  bool wait=false;



  Future getMovies() async
  {
  List<MovieModel> list=[];
    var response=await http.get(Uri.parse(moviesApi));
    var data=jsonDecode(response.body)["results"];
    data.forEach((element)=>list.add(MovieModel(title: element["original_title"], id: element["id"], overview: element["overview"], backdropPath: element["backdrop_path"],releaseDate: element["release_date"], posterPath: element["poster_path"])));
    allMovies=list;
    notifyListeners();
  }

  Future getGenres(int movieId) async{
  List<String> list=[];
    var response=await http.get(Uri.parse("https://api.themoviedb.org/3/movie/$movieId?api_key=$apikey"));
    var data=jsonDecode(response.body)["genres"];
    data.forEach((element)=>list.add(element["name"]));
    genres=list;
    notifyListeners();
  }
}