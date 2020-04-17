// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:movieapp/presentation/pages/movie_list.dart';
import 'package:movieapp/presentation/pages/movie_details.dart';
import 'package:movieapp/domain/entities/movie.dart';

class Router {
  static const movieListPage = '/';
  static const movieDetailsPage = '/movie-details-page';
  static final navigator = ExtendedNavigator();
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Router.movieListPage:
        return MaterialPageRoute<dynamic>(
          builder: (_) => MovieListPage(),
          settings: settings,
        );
      case Router.movieDetailsPage:
        if (hasInvalidArgs<MovieDetailsPageArguments>(args)) {
          return misTypedArgsRoute<MovieDetailsPageArguments>(args);
        }
        final typedArgs =
            args as MovieDetailsPageArguments ?? MovieDetailsPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (_) =>
              MovieDetailsPage(key: typedArgs.key, movie: typedArgs.movie),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

//**************************************************************************
// Arguments holder classes
//***************************************************************************

//MovieDetailsPage arguments holder class
class MovieDetailsPageArguments {
  final Key key;
  final Movie movie;
  MovieDetailsPageArguments({this.key, this.movie});
}
