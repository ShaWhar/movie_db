
import 'package:movie_db_zoom/data/apply/tmdb_apply.dart';
import 'package:movie_db_zoom/data/vos/details_vo/details_vo.dart';
import 'package:movie_db_zoom/data/vos/genres_vo/genres_vo.dart';
import 'package:movie_db_zoom/data/vos/movie_vo/movie_vo.dart';
import 'package:movie_db_zoom/network/data_agent/tmdb_data_agent_impl.dart';
import '../../network/data_agent/tmdb_data_agent.dart';

class TMDBApplyImpl extends TMDBApply{
  final TMDBDataAgent dataAgent=TMDBDataAgentImpl();
  TMDBApplyImpl._();

  static final TMDBApplyImpl _singleton=TMDBApplyImpl._();
  factory TMDBApplyImpl()=>_singleton;

  @override
  Future<List<MovieVO>?> getNowPlayingMovie(int page) =>dataAgent.getNowPlayingMovies(page).then((value) {
    var temp=value;
    temp=temp?.map((e) {
      e.isGetNowPlaying=true;
      return e;
    }).toList();
    return value;
  });

  @override
  Future<List<GenresVO>?> getGenre() {
    // TODO: implement getGenre
    throw UnimplementedError();
  }

  @override
  Future<List<DetailsVO>?> getMovieDetail(int movieID) {
    // TODO: implement getMovieDetail
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getMoviesByGenre(int page, int genreID) {
    // TODO: implement getMoviesByGenre
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getPopularMovie(int page) {
    // TODO: implement getPopularMovie
    throw UnimplementedError();
  }

  @override
  Future<List<MovieVO>?> getSimilarMovie(int page, int movieID) {
    // TODO: implement getSimilarMovie
    throw UnimplementedError();
  }

}