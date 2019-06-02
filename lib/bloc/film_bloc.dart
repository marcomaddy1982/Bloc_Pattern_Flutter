import 'dart:async';

import 'package:bloc_example/model/film_state.dart';
import 'package:bloc_example/repository/film_repository.dart';
import 'package:rxdart/rxdart.dart';

class FilmBloc {
  FilmRepository filmRepository;

  Sink<bool> get film => _filmStream.sink;
  final _filmStream = BehaviorSubject<bool>();

  Stream<FilmState> films;

  FilmBloc(this.filmRepository) {
    films = _filmStream.stream
        .flatMap(_search);
  }

  void dispose() {
    _filmStream.close();
  }

  Stream<FilmState> _search(bool query) async* {
    yield FilmState(loading: true);
    try {
      final films = await filmRepository.getFilms(query);
      yield FilmState(films: films);
    } catch (e) {
      yield FilmState(error: true);
    }
  }
}
