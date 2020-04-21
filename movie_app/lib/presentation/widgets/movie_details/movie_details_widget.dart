import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie.dart';
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Scaffold(
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
                movie: widget.movie,
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

}
