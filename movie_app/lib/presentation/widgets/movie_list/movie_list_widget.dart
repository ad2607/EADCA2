import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movieapp/app_localizations.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/presentation/bloc/movie_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_list/movie_list_item.dart';

class MovieListWidget extends StatefulWidget {
  final List<Movie> movies;

  const MovieListWidget({Key key, this.movies}) : super(key: key);

  @override
  _MovieListWidgetState createState() => _MovieListWidgetState();
}

class _MovieListWidgetState extends State<MovieListWidget> {
  @override
  Widget build(BuildContext context) {
    if (widget.movies.isEmpty) {
      return Expanded(
        child: Scaffold(
          backgroundColor: Theme.of(context).primaryColor,
          appBar: AppBar(
            actions: <Widget>[
              Container(
                width: 200,
                height: 60,
                child: TextFormField(
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.white,
                      ),
                    ),
                    labelText: AppLocalizations.of(context).translate('search'),
                    labelStyle: TextStyle(color: Colors.white),
                  ),
                  style: TextStyle(color: Colors.white),
                  keyboardType: TextInputType.text,
                  onChanged: (searchTerm) => {
                    if (searchTerm == '')
                      {
                        _retrieveAllMovies(),
                      }
                    else
                      {
                        _searchForMovies(searchTerm),
                      }
                  },
                ),
              ),
            ],
          ),
          body: Column(
            children: <Widget>[
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 300),
                  child: Text(
                    AppLocalizations.of(context).translate('no_movies_found'),
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    }
    return Expanded(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(80),
                  child: AppBar(
                    elevation: 20,
            actions: <Widget>[
              Expanded(
                            child: Container(
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.white,
                        ),
                      ),
                      labelText: AppLocalizations.of(context).translate('search'),
                      labelStyle: TextStyle(color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    keyboardType: TextInputType.text,
                    onChanged: (searchTerm) => {
                      if (searchTerm == '')
                        {
                          _retrieveAllMovies(),
                        }
                      else
                        {
                          _searchForMovies(searchTerm),
                        }
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: GridView.count(
                crossAxisCount: 3,
                childAspectRatio: 2 / 4.7,
                children: <Widget>[
                  for (var movies in widget.movies)
                    MovieListItem(movie: movies),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _searchForMovies(String searchTerm) {
    BlocProvider.of<MovieBloc>(context).add(
      SearchRequested(
        searchTerm: searchTerm,
      ),
    );
  }

  void _retrieveAllMovies() {
    BlocProvider.of<MovieBloc>(context).add(
      InitialLoadRequested(),
    );
  }
}
