import 'package:movie_db_zoom/data/vos/movie_vo/movie_vo.dart';

import '../vos/details_vo/details_vo.dart';
import '../vos/genres_vo/genres_vo.dart';

abstract class TMDBApply{
  Future<List<MovieVO>?>getNowPlayingMovie(int page);

  Future<List<MovieVO>?>getPopularMovie(int page);

  Future<List<GenresVO>?>getGenre();

  Future<List<MovieVO>?>getMoviesByGenre(int page,int genreID);

  Future<List<DetailsVO>?>getMovieDetail(int movieID);

  Future<List<MovieVO>?>getSimilarMovie(int page,int movieID);

}