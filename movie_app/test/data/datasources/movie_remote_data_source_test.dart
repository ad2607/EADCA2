import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:movieapp/core/error/exceptions.dart';
import 'package:movieapp/data/datasources/movie_remote_data_source.dart';
import 'package:http/http.dart' as http;
import 'package:movieapp/data/models/movie_model.dart';
import 'package:matcher/matcher.dart';

import '../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  MovieRemoteDataSourceImpl dataSource;
  MockHttpClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockHttpClient();
    dataSource = MovieRemoteDataSourceImpl(client: mockHttpClient);
  });

  void setUpMockHttpClientSuccess200() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response(fixture('movie.json'), 200));
  }

  void setUpMockHttpClientFailure404() {
    when(mockHttpClient.get(any, headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('Something went wrong', 404));
  }

  group('getAllMovies', () {
    final tEndpoint = 'all';
    Iterable apiResponse = json.decode(fixture('movie.json'));
      List<MovieModel> tMovies =
          apiResponse.map((model) => MovieModel.fromJson(model)).toList();

    test(
      '''should perform a GET request on a URL with all
       being the endpoint and with application/json header''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.getAllMovies();
        // assert
        verify(mockHttpClient.get(
          'https://movieapi20200406063228.azurewebsites.net/api/Movies/$tEndpoint',
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.getAllMovies();
        // assert
        expect(result, equals(tMovies));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.getAllMovies;
        // assert
        expect(() => call(), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });

  group('searchMovies', () {
    final tSearchTerm = 'Avengers';
    Iterable apiResponse = json.decode(fixture('movie.json'));
      List<MovieModel> tMovies =
          apiResponse.map((model) => MovieModel.fromJson(model)).toList();

    test(
      '''should perform a GET request on a URL with tSearchTerm
       being the endpoint and with application/json header''',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        dataSource.searchMovies(tSearchTerm);
        // assert
        verify(mockHttpClient.get(
          "https://movieapi20200406063228.azurewebsites.net/api/Movies/$tSearchTerm",
          headers: {
            'Content-Type': 'application/json',
          },
        ));
      },
    );

    test(
      'should return NumberTrivia when the response code is 200 (success)',
      () async {
        // arrange
        setUpMockHttpClientSuccess200();
        // act
        final result = await dataSource.searchMovies(tSearchTerm);
        // assert
        expect(result, equals(tMovies));
      },
    );

    test(
      'should throw a ServerException when the response code is 404 or other',
      () async {
        // arrange
        setUpMockHttpClientFailure404();
        // act
        final call = dataSource.searchMovies;
        // assert
        expect(() => call(tSearchTerm), throwsA(TypeMatcher<ServerException>()));
      },
    );
  });
}