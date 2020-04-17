import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
      return Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 60, left: 20, right: 20),
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
                labelText: 'Search',
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
          Center(
            child: Container(
              padding: EdgeInsets.only(top: 300),
              child: Text(
                'No movies found',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      );
    }
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 60, left: 20, right: 20),
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
              labelText: 'Search',
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
        Expanded(
          child: GridView.count(
            crossAxisCount: 3,
            childAspectRatio: 2 / 4.7,
            children: <Widget>[
              for (var movies in widget.movies) MovieListItem(movie: movies),
            ],
          ),
        ),
      ],
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
