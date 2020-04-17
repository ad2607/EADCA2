import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/core/error/failure.dart';
import 'package:movieapp/core/network/network_info.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:movieapp/data/models/movie_model.dart';
import 'package:movieapp/data/repositories/movie_repository_impl.dart';

class MockRemoteDataSource extends Mock implements MovieRemoteDataSource {}

class MockNetworkInfo extends Mock implements NetworkInfo {}

void main() {
  MovieRepositoryImpl repository;
  MockRemoteDataSource mockRemoteDataSource;
  MockNetworkInfo mockNetworkInfo;

  setUp(() {
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = MovieRepositoryImpl(
      movieRemoteDataSource: mockRemoteDataSource,
      networkInfo: mockNetworkInfo,
    );
  });

  void runTestsOnline(Function body) {
    group('device is online', () {
      setUp(() {
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      });

      body();
    });
  }

  group('getAllMovies', () {
    final tResult = List<MovieModel>();

    test(
      'Should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.getAllMovies();
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'Should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllMovies())
              .thenAnswer((_) async => tResult);
          // act
          final result = await repository.getAllMovies();
          // assert
          verify(mockRemoteDataSource.getAllMovies());
          expect(result, equals(Right(tResult)));
        },
      );

      test(
        'Should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.getAllMovies())
              .thenThrow(ServerException());
          // act
          final result = await repository.getAllMovies();
          // assert
          verify(mockRemoteDataSource.getAllMovies());
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });


  group('searchMovies', () {
    final tSearchTerm = 'Avengers';
    final tResult = List<MovieModel>();

    test(
      'Should check if the device is online',
      () async {
        // arrange
        when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
        // act
        repository.searchMovies(tSearchTerm);
        // assert
        verify(mockNetworkInfo.isConnected);
      },
    );

    runTestsOnline(() {
      test(
        'Should return remote data when the call to remote data source is successful',
        () async {
          // arrange
          when(mockRemoteDataSource.searchMovies(any))
              .thenAnswer((_) async => tResult);
          // act
          final result = await repository.searchMovies(tSearchTerm);
          // assert
          verify(mockRemoteDataSource.searchMovies(tSearchTerm));
          expect(result, equals(Right(tResult)));
        },
      );

      test(
        'Should return server failure when the call to remote data source is unsuccessful',
        () async {
          // arrange
          when(mockRemoteDataSource.searchMovies(any))
              .thenThrow(ServerException());
          // act
          final result = await repository.searchMovies(tSearchTerm);
          // assert
          verify(mockRemoteDataSource.searchMovies(tSearchTerm));
          expect(result, equals(Left(ServerFailure())));
        },
      );
    });
  });
}
