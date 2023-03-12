///Base URL
const String kBaseURL='https://api.themoviedb.org/3';

///End Point
const String kGetNowPlayingEndPoint='/movie/now_playing';
const String kGetGenreEndPoint='/genre/movie/list';
const String kGetMovieDetailsEndPoint='/movie/{$kPathParameterMovieID}';
const String kGetMovieByGenreEndPoint='/discover/movie';
const String kGetMovieByPopularEndPoint='/movie/popular';
const String kGetActorsEndPoint='/person/popular';
const String kGetActorsByMovieIDEndPoint='/movie/{$kPathParameterMovieID}/credits';
const String kGetSimilarMoviesEndPoint='/movie/{$kPathParameterMovieID}/similar';



///API Token
const String kAPIToken='6ba57a8fa213613268b61de49d70fffe';



///Query Params
const String kAPIKey='api_key';
const String kPageKey='page';
const String kQueryParamsWithGenre='genreID';
const String kLanguageKey='language';

///Path Parameter
const String kPathParameterMovieID='movie_id';

///Image const
const String kBasedURL='https://image.tmdb.org/t/p/w500';
const String kDefaultImage='https://pusat.edu.np/wp-content/uploads/2022/09/default-image.jpg';



