import 'package:bloc_example/model/film.dart';
import 'package:bloc_example/repository/film_repository.dart';
import 'package:http/http.dart' as http;

class FilmService implements FilmRepository {
  final _filmUrl = 'https://swapi.co/api/films';

  @override
  Future<List<Film>> getFilms() async {
    final response = await http.get(_filmUrl);
    return filmFromJson(response.body);
  }
}