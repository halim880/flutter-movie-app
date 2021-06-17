import 'package:movie_app/model/movie.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class NowPlayingMoviesBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<List<Movie>> _subject = BehaviorSubject();

  getNowPlayingMovies() async{
    List<Movie> response = await _repository.getPlayingMovies();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<List<Movie>> get subject => _subject;
}

final nowPlayingMoviesBloc = NowPlayingMoviesBloc();