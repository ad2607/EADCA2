import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/widgets/error_state_widget.dart';
import 'package:movieapp/presentation/widgets/failure.dart';
import 'package:movieapp/presentation/widgets/loading.dart';
import 'package:movieapp/presentation/widgets/movie_list/movieListInitialLoad.dart';
import 'package:movieapp/presentation/widgets/movie_list/movie_list_widget.dart';

class MovieListPage extends StatefulWidget {
  @override
  _MovieListPageState createState() => _MovieListPageState();
}

class _MovieListPageState extends State<MovieListPage> {
  @override
  Widget build(BuildContext context) {
    return buildBody(context);
  }

  BlocProvider<MovieBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieBloc>(),
      child: Column(
        children: <Widget>[
          BlocListener<MovieBloc, MovieState>(
              listener: (context, state) {},
              child: BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieInitial) {
                    return MovieListInitialLoad();
                  } else if (state is Loaded) {
                    return MovieListWidget(movies: state.movies);
                  } else if (state is Loading) {
                    return LoadingWidget();
                  } else if (state is Error) {
                    return ErrorStateWidget();
                  } else {
                    return FailureWidget();
                  }
                },
              )),
        ],
      ),
    );
  }
}
