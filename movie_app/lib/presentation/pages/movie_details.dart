import 'package:flutter/material.dart';
import 'package:movieapp/domain/entities/movie.dart';
import 'package:movieapp/presentation/widgets/movie_details/directors_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/movie_length_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/poster_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/release_date_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/review_score_section.dart';
import 'package:movieapp/presentation/widgets/movie_details/section_divider.dart';
import 'package:movieapp/presentation/widgets/movie_details/synopsis_section.dart';

class MovieDetailsPage extends StatefulWidget {
  final Movie movie;

  const MovieDetailsPage({Key key, this.movie}) : super(key: key);

  @override
  _MovieDetailsPageState createState() => _MovieDetailsPageState();
}

class _MovieDetailsPageState extends State<MovieDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
