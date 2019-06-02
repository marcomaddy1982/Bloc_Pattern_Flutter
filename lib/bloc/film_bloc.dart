import 'dart:async';

import 'package:bloc_example/model/film_state.dart';
import 'package:bloc_example/repository/film_repository.dart';
import 'package:rxdart/rxdart.dart';

class FilmBloc {
  FilmRepository filmRepository;

  final _filmStream = BehaviorSubject<void>.seeded(null);
  Stream<FilmState> films;

  FilmBloc(this.filmRepository) {
    films = _filmStream.stream
    .flatMap(_start);
  }

  void dispose() {
    _filmStream.close();
  }

  Stream<FilmState> _start(void value) async* {
    yield FilmState(loading: true);
    try {
      final films = await filmRepository.getFilms();
      yield FilmState(films: films);
    } catch (e) {
      yield FilmState(error: true);
    }
  }
}
