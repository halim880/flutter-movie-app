import 'package:movie_app/model/genre_response.dart';
import 'package:movie_app/model/movie_list.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class MoviesListByGenresBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<MovieResponse> _subject = BehaviorSubject();

  getMoviesByGenre(int id) async{
    MovieResponse response = await _repository.getMoviesByGenre(id);
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<MovieResponse> get subject => _subject;
}

final moviesByGenresBloc = MoviesListByGenresBloc();