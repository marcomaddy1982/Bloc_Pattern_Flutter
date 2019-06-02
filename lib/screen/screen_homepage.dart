import 'package:flutter/material.dart';
import 'package:bloc_example/model/film.dart';
import 'package:bloc_example/model/film_state.dart';
import 'package:bloc_example/bloc/film_bloc.dart';
import 'package:flutter_simple_dependency_injection/injector.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomePageState(Injector.getInjector().get<FilmBloc>());
  }
}

class HomePageState extends State<HomePage> {
  final FilmBloc bloc;

  HomePageState(this.bloc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc Example"),
      ),
      body: Column(
        children: <Widget>[
          _buildFilmListTitle(),
          _buildStateWidget(),
        ],
      ),
    );
  }

  Widget _buildFilmListTitle() {
    return ListTile(title: Text('Those are the FILMS'));
  }

  Widget _buildStateWidget() {
    return StreamBuilder<FilmState>(
      initialData: FilmState(loading: true),
      stream: bloc.films,
      builder: (context, snapshot) {
        if (snapshot.data != null) {
          final state = snapshot.data;
          if (!state.loading && !state.error) {
            return buildFilmList(state.films);
          } else {
            return CircularProgressIndicator();
          }
        } else {
          return CircularProgressIndicator();
        }
      },
    );
  }
}

Widget buildFilmList(List<Film> films) {
  return Expanded(
      child: ListView.builder(
    key: Key('place-list'),
    itemCount: films.length,
    itemBuilder: (BuildContext ctxt, int index) =>_buildFilmItem(films[index]),
  ));
}

Widget _buildFilmItem(Film film) {
  return ListTile(
    title: Text(film.title),
  );
}
