
import 'package:bloc_example/bloc/film_bloc.dart';
import 'package:bloc_example/repository/film_repository.dart';
import 'package:bloc_example/repository/film_service.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class InjectionInit {
  static void init() {
    final injector = Injector.getInjector();
    injector.map<FilmRepository>((i) => new FilmService(),
        isSingleton: true);
    injector.map<FilmBloc>(
        (i) => new FilmBloc(injector.get<FilmRepository>()));
  }

  static void dispose() {
    Injector.getInjector().dispose();
  }
}