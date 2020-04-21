import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/injection_container.dart';
import 'package:movieapp/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:movieapp/presentation/widgets/error_state_widget.dart';
import 'package:movieapp/presentation/widgets/failure.dart';
import 'package:movieapp/presentation/widgets/loading.dart';
import 'package:movieapp/presentation/widgets/movie_details/movie_details_widget.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  List<Movie> currentMovieList;

  Future<bool> _onBackPressed() async {
    if (currentMovieList != null) {
      Navigator.of(context).pop(currentMovieList);
    } else {
      Navigator.of(context).pop();
    }

    return false;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: buildBody(context),
    );
  }

  BlocProvider<MovieDetailsBloc> buildBody(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<MovieDetailsBloc>(),
      child: Column(
        children: <Widget>[
          BlocListener<MovieDetailsBloc, MovieDetailsState>(
              listener: (context, state) {
            if (state is UserRatingAdded) {
              setState(() {
                currentMovieList = state.movieList;
              });
            }
          }, child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
            builder: (context, state) {
              if (state is MovieDetailsInitial) {
                return MovieDetailsWidget(movie: widget.movie);
              } else if (state is UserRatingAdded) {
                return MovieDetailsWidget(movie: state.movie);
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
