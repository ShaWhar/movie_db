import 'package:dio/dio.dart';
import 'package:movie_db_zoom/constant/api_constant.dart';
import 'package:retrofit/retrofit.dart';

import '../../../data/vos/details_vo/details_vo.dart';
import '../actors_response/actors_response.dart';
import '../credit_response/credit_response.dart';
import '../genres_response/genres_response.dart';
import '../movie_response/movie_response.dart';

part 'tmdb_api.g.dart';

@RestApi(baseUrl: kBaseURL)
abstract class TheMovieDBAPI {

  factory TheMovieDBAPI(Dio dio)=>_TheMovieDBAPI(dio);

  @GET(kGetNowPlayingEndPoint)
  Future<MovieResponse> getNowPlayingMovies(
    @Query(kAPIKey) String apiKey,
    @Query(kPageKey) int page,
  );

  @GET(kGetMovieByPopularEndPoint)
  Future<MovieResponse> getPopularMovies(
      @Query(kAPIKey) String apiKey,
      @Query(kPageKey) int page,
      );

  @GET(kGetGenreEndPoint)
  Future<GenresResponse> getGenres(
      @Query(kAPIKey) String apiKey,
      );

  @GET(kGetMovieByGenreEndPoint)
  Future<MovieResponse> getMoviesByGenre(
      @Query(kAPIKey) String apiKey,
      @Query(kPageKey) int page,
      @Query(kQueryParamsWithGenre) int genreID,
      );

  @GET(kGetActorsEndPoint)
  Future<ActorsResponse> getActors(
      @Query(kAPIKey) String apiKey,
      @Query(kPageKey) int page,

      );

  @GET(kGetMovieDetailsEndPoint)
  Future<DetailsVO> getMoviesDetails(
      @Query(kAPIKey) String apiKey,
      @Query(kPathParameterMovieID) int movieID,
      );

  @GET(kGetActorsByMovieIDEndPoint)
  Future<CreditResponse> getCastAndCrew(
      @Query(kAPIKey) String apiKey,
      @Query(kPathParameterMovieID) int movieID,
      );

  @GET(kGetSimilarMoviesEndPoint)
  Future<MovieResponse> getSimilarMovies(
      @Query(kAPIKey) String apiKey,
      @Query(kPathParameterMovieID) int movieID,
      );


}
