
import 'package:movie_app/model/person_response.dart';
import 'package:movie_app/repository/movie_repository.dart';
import 'package:rxdart/rxdart.dart';

class PersonsBloc {
  final MovieRepository _repository = MovieRepository();
  final BehaviorSubject<PersonResponse> _subject = BehaviorSubject();

  getMovies() async{
    PersonResponse response = await _repository.getPersons();
    _subject.sink.add(response);
  }

  dispose(){
    _subject.close();
  }
  BehaviorSubject<PersonResponse> get subject => _subject;
}

final personsBloc = PersonsBloc();