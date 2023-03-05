
import 'package:movie_db_zoom/data/vos/movie_vo/movie_vo.dart';
import '../../data/vos/details_vo/details_vo.dart';
import '../../data/vos/genres_vo/genres_vo.dart';

abstract class TMDBDataAgent{
  Future<List<MovieVO>?>getNowPlayingMovies(int page);

  Future<List<MovieVO>?>getPopularMovies(int page);

  Future<List<GenresVO>?>getGenres();

  Future<List<MovieVO>?>getMoviesByGenres(int page,int genreID);

  Future<List<DetailsVO>?>getMovieDetails(int movieID);

  Future<List<MovieVO>?>getSimilarMovies(int page,int movieID);
}