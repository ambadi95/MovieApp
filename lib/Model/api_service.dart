
import 'package:dio/dio.dart';
import 'package:movie_app/Database/local_database.dart';
import 'package:movie_app/Database/movie_details_db.dart';
import 'package:movie_app/Response/movie_list_response.dart';
import 'package:movie_app/Response/movie_details_response.dart';
import 'package:sqflite/sqflite.dart';

class ApiSerices{
  static String apiKey = "35882e11";
  static String baseUrl = "https://omdbapi.com";

  List<Search> movieList = [];

  DatabaseHelper databaseHelper = new DatabaseHelper();

  Future fetchMovieList(search) async {
    String searchQuery =  search.length == 0 ? 'Avengers' : search.toString().trim();
    try {
      movieList =null;
      Response response = await Dio().get(baseUrl + '?s=${searchQuery}&apikey=${apiKey}');
      if(response.data['Search'] !=null){
        MovieList movieResponse = MovieList.fromJson(response.data);
        movieList = movieResponse.search;
        return movieList;
      }else{
        return 'error';
      }

    } on DioError catch (e) {
      print(e);
    }
  }

  Future fetchMovieDetails(imdbID) async {
    List<Map> data = await showMovieData(imdbID);
      if(data.isNotEmpty){
        return data;
      }else {
        try {
          Response response = await Dio().get(
              baseUrl + '?i=${imdbID}&apikey=${apiKey}');
          MovieDetailResponse movieDetailResponse = MovieDetailResponse.fromMap(
              response.data);
          await insertData(movieDetailResponse);
          List<Map> data = await showMovieData(imdbID);
          if(data.isNotEmpty){
            return data;
          }
        } on DioError catch (e) {
          print(e);
        }
      }
  }

  MovieDetailDb _movieDetailDb;

  insertData(MovieDetailResponse movieDetails) async{
      var check = await databaseHelper.readDb(
          'SELECT * FROM ${DatabaseHelper.movieDetailTable} WHERE imdbId = "${movieDetails.imdbId}"'
      );
      int exists = Sqflite.firstIntValue(check);
      if(exists == 1){
        print('exists');
        _movieDetailDb = MovieDetailDb(
            movieDetails.title,movieDetails.year,movieDetails.rated,movieDetails.released,movieDetails.runtime,movieDetails.genre,movieDetails.director,
            movieDetails.writer,movieDetails.actors,movieDetails.plot,movieDetails.poster,movieDetails.metascore,movieDetails.imdbId
        );
        var update = await databaseHelper.updateDb('productTable', _movieDetailDb.toMap(), '${DatabaseHelper.imdbId} = ?', [movieDetails.imdbId]);
      }else{

        _movieDetailDb = MovieDetailDb(
            movieDetails.title,movieDetails.year,movieDetails.rated,movieDetails.released,movieDetails.runtime,movieDetails.genre,movieDetails.director,
            movieDetails.writer,movieDetails.actors,movieDetails.plot,movieDetails.poster,movieDetails.metascore,movieDetails.imdbId
        );
        var insert = await databaseHelper.insertDb(_movieDetailDb.toMap(), 'movieDetailTable');
      }

  }

  Future showMovieData(imdbId) async{
     var result = await databaseHelper.readDb('SELECT * FROM ${DatabaseHelper.movieDetailTable} WHERE ${DatabaseHelper.imdbId}="${imdbId}"',);
    return result;

  }

}