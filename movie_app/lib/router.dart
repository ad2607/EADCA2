
import 'package:auto_route/auto_route_annotations.dart';
import 'package:movieapp/presentation/pages/movie_details.dart';
import 'package:movieapp/presentation/pages/movie_list.dart';

@MaterialAutoRouter()
class $Router {
  @initial
  MovieListPage movieListPage;
  MovieDetailsPage movieDetailsPage;
}
