import 'package:bloc_example/model/film.dart';
abstract class FilmRepository {
  Future<List<Film>> getFilms();
}