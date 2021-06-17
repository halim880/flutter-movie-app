

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movie_app/model/movie.dart';
import 'package:http/http.dart' as http;

class  MovieRepository {
  final String apiKey = '363f32475685670f96b42c9f8ae14cf6';
  final String mainUrl = 'https://api.themoviedb.org/3/';
  final String token = '?api_key=363f32475685670f96b42c9f8ae14cf6';
  final String append = '&append_to_response=credits,videos,images';

  final Dio _dio = Dio();

  var getPopularUrl = "https://api.themoviedb.org/3/discover/movie?api_key=363f32475685670f96b42c9f8ae14cf6";
  var getMoviesUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=363f32475685670f96b42c9f8ae14cf6';
  var getPlayingUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=363f32475685670f96b42c9f8ae14cf6';
  var getPersonsUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=363f32475685670f96b42c9f8ae14cf6';
  var getGenresUrl = 'https://api.themoviedb.org/3/discover/movie?api_key=363f32475685670f96b42c9f8ae14cf6';

  // Future<Movie> getMovies() async{
  //   var params = {
  //     "api_key" : apiKey,
  //     "language": "en-US",
  //     "page": 1
  //   };

  //   try {
  //     Response response = await _dio.get(getPopularUrl, queryParameters: params);
  //     return Movie.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exeption occured: $error stacktrace: $stacktrace");
  //     return Movie.withError("$error");
  //   }
  // }

  Future<List<Movie>> getPlayingMovies() async{

    List<Movie> movies = [];
    try {
      var response = await http.get(Uri.parse(getPlayingUrl), headers: {'Accept': 'application/json'});
      var body = json.decode(response.body);
      List<dynamic> results = body['results'];
      for(var item in results){
        movies.add(Movie.fromJson(item));
      }
      return movies;
    } catch (error, stacktrace) {
      print("Exeption occured: $error stacktrace: $stacktrace");
      return movies;
    }
  }

  // Future<GenreResponse> getGenres() async{
  //   var params = {
  //     "api_key" : apiKey,
  //     "language": "en-US",
  //     "page": 1
  //   };

  //   try {
  //     Response response = await _dio.get(getGenresUrl, queryParameters: params);
  //     return GenreResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exeption occured: $error stacktrace: $stacktrace");
  //     return GenreResponse.withError("$error");
  //   }
  // }

  // Future<PersonResponse> getPersons() async{
  //   var params = {
  //     "api_key" : apiKey,
  //     "language": "en-US",
  //     "page": 1
  //   };

  //   try {
  //     Response response = await _dio.get(getPersonsUrl, queryParameters: params);
  //     return PersonResponse.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exeption occured: $error stacktrace: $stacktrace");
  //     return PersonResponse.withError("$error");
  //   }
  // }

  // Future<Movie> getMoviesByGenre(int genreId) async{
  //   var params = {
  //     "api_key" : apiKey,
  //     "language": "en-US",
  //     "page": 1,
  //     'with_genres': genreId,
  //   };

  //   try {
  //     Response response = await _dio.get(getPersonsUrl, queryParameters: params);
  //     return Movie.fromJson(response.data);
  //   } catch (error, stacktrace) {
  //     print("Exeption occured: $error stacktrace: $stacktrace");
  //     return Movie.withError("$error");
  //   }
  // }
}