import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:movieapp/presentation/widgets/movie_details/directors_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/movie_length_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/poster_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/release_date_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/review_score_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/section_divider.dart';
import 'package:movieapp/presentation/widgets/movie_details/synopsis_section.dart';

class MovieDetailsWidget extends StatefulWidget {
  final Movie movie;

  const MovieDetailsWidget({Key key, @required this.movie}) : super(key: key);

  @override
  _MovieDetailsWidgetState createState() => _MovieDetailsWidgetState();
}

class _MovieDetailsWidgetState extends State<MovieDetailsWidget> {
  int rating = 5;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(onPressed: _showDialog),
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              PosterSection(
                id: widget.movie.id,
                title: widget.movie.title,
              ),
              SectionDivider(),
              ReviewScoreSection(
                imdbRating: widget.movie.imdbRating,
                rottenTomatoesScore: widget.movie.rottenTomatoesScore,
                userRatings: widget.movie.userRatings,
              ),
              SectionDivider(),
              SynopsisSection(
                synopsis: widget.movie.description,
              ),
              SectionDivider(),
              DirectorsSection(
                directors: widget.movie.director,
              ),
              SectionDivider(),
              MovieLengthSection(
                length: widget.movie.length,
              ),
              SectionDivider(),
              ReleaseDateSection(
                releaseDate: widget.movie.releaseDate,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDialog() {
    // flutter defined function
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: Text("Rate this Movie"),
          content: RatingBar(
            initialRating: 5,
            minRating: 1,
            direction: Axis.horizontal,
            allowHalfRating: false,
            itemCount: 10,
            itemBuilder: (context, _) => Icon(
              Icons.star,
              color: Colors.amber,
            ),
            onRatingUpdate: (newRating) {
              rating = newRating.toInt();
              print(newRating);
            },
          ),
          actions: <Widget>[
            // usually buttons at the bottom of the dialog
            new FlatButton(
              child: new Text("Confirm"),
              onPressed: () {
                _addUserRating();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _addUserRating() {
    BlocProvider.of<MovieDetailsBloc>(context).add(
      AddUserRatingRequested(
        movie: widget.movie,
        userRating: rating,
      ),
    );
  }
}
