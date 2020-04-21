import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/router.gr.dart';

class MovieListItem extends StatefulWidget {
  final Movie movie;
  final Function(List<Movie>) callback;
  const MovieListItem({Key key, this.movie, this.callback}) : super(key: key);

  @override
  _MovieListItemState createState() => _MovieListItemState();
}

class _MovieListItemState extends State<MovieListItem> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 6),
      child: Column(
        children: <Widget>[
          Container(
            child: InkWell(
              key: Key('moviePosterListItem'),
              onTap: () => showMovieDetails(widget.movie.id),
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://movieapi20200406063228.azurewebsites.net/api/Movies/poster?id=' +
                      widget.movie.id.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(4),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                widget.movie.title,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void showMovieDetails(int id) {
    Navigator.of(context)
        .pushNamed(
      Router.movieDetailsPage,
      arguments: MovieDetailsPageArguments(
        movie: widget.movie,
      ),
    )
        .then((value) {
      widget.callback(value);
    });
  }
}
