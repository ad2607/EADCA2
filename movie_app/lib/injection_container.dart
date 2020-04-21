import 'package:data_connection_checker/data_connection_checker.dart';
import 'package:get_it/get_it.dart';
import 'package:movieapp/core/network/network_info.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';
import 'package:movieapp/domain/repository/movie_repository.dart';
import 'package:movieapp/domain/usecases/add_user_rating.dart';
import 'package:movieapp/domain/usecases/get_all_movies.dart';
import 'package:movieapp/domain/usecases/search_movies.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/presentation/bloc/movie_details_bloc/movie_details_bloc.dart';
import 'package:movieapp/presentation/bloc/movie_list_bloc/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Bloc

  sl.registerFactory(() => MovieBloc(
        getAllMovies: sl(),
        searchMovies: sl(),
      ));

  sl.registerFactory(() => MovieDetailsBloc(
        addUserRating: sl(),
        getAllMovies: sl(),
      ));

  // Use cases
  sl.registerLazySingleton(() => GetAllMovies(sl()));
  sl.registerLazySingleton(() => SearchMovies(sl()));
  sl.registerLazySingleton(() => AddUserRating(sl()));

  // Repository
  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      movieRemoteDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => DataConnectionChecker());
}
