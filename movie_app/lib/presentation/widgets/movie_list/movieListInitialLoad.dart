import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_list_bloc/movie_bloc.dart';

class MovieListInitialLoad extends StatefulWidget {
  @override
  _MovieListInitialLoadState createState() => _MovieListInitialLoadState();
}

class _MovieListInitialLoadState extends State<MovieListInitialLoad> {
  @override
  Widget build(BuildContext context) {
    loadMovies();
    return Expanded(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Container(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      ),
    );
  }

  void loadMovies() {
    BlocProvider.of<MovieBloc>(context).add(InitialLoadRequested());
  }
}