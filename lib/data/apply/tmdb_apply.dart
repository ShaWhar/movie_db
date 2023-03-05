import 'package:movie_db_zoom/data/vos/movie_vo/movie_vo.dart';

abstract class TMDBApply{
  Future<List<MovieVO>?>getNowPlayingMovie(int page);

}