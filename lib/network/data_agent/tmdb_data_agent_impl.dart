import 'package:dio/dio.dart';
import 'package:movie_db_zoom/constant/api_constant.dart';
import 'package:movie_db_zoom/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db_zoom/network/data_agent/tmdb_data_agent.dart';
import '../../data/vos/details_vo/details_vo.dart';
import '../../data/vos/genres_vo/genres_vo.dart';
import '../response/api/tmdb_api.dart';

class TMDBDataAgentImpl extends TMDBDataAgent {
  late TheMovieDBAPI _api;

  TMDBDataAgentImpl._() {
    _api = TheMovieDBAPI(Dio());
  }

  static final TMDBDataAgentImpl _singleton = TMDBDataAgentImpl._();

  factory TMDBDataAgentImpl() => _singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovies(int page) => _api
      . getNowPlayingMovies(kAPIToken, page) //Future<MovieResponse>
      .asStream() //Stream<MovieResponse>
      .map((event) => event.results) //Stream<List<MovieVO>?>
      .first;

  @override
  Future<List<MovieVO>?> getPopularMovies(int page) => _api
      . getPopularMovies(kAPIToken, page)
      .asStream()
      .map((event) => event.results)
      .first;

  @override
  Future<List<GenresVO>?> getGenres() {
    // TODO: implement getGenres
    throw UnimplementedError();
  }

  @override
  Future<List<DetailsVO>?> getMovieDetails(int movieID) {
    // TODO: implement getMovieDetails
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenres(int page, int genreID) {
    // TODO: implement getMoviesByGenres
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getSimilarMovies(int page, int movieID) {
    // TODO: implement getSimilarMovies
    throw UnimplementedError();
  }

}
