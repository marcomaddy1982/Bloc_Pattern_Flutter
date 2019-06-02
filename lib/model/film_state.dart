import 'package:bloc_example/model/film.dart';

class FilmState {
  final bool loading;
  final bool error;
  final List<Film> films;

  FilmState(
      {this.loading = false, this.error = false, this.films});
}