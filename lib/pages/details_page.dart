import 'package:flutter/material.dart';
import '../constant/strings.dart';
import '../data/apply/actors_apply.dart';
import '../data/apply/actors_apply_impl.dart';
import '../data/apply/cast_apply.dart';
import '../data/apply/cast_apply_impl.dart';
import '../data/apply/tmdb_apply.dart';
import '../data/apply/tmdb_apply_impl.dart';
import '../data/vos/actors_vo/actors_vo.dart';
import '../data/vos/details_vo/details_vo.dart';
import '../data/vos/genres_vo/genres_vo.dart';
import '../details_page_item_views/about_film_item_view.dart';
import '../details_page_item_views/move_genre_and_story_line_section_item_view.dart';
import '../details_page_item_views/sliver_app_bar_item_view.dart';
import '../home_page_item_views/actors_and_creators_section_item_view.dart';
import '../home_page_item_views/best_popular_movie_item_view.dart';

class DetailsPage extends StatefulWidget {

 final List<ActorsVO> actors;
 final DetailsVO details;
 final GenresVO genres;


  const DetailsPage({
    Key? key,
    required this.movieID,
    required this.actors,
    required this.details,
    required this.genres,
  }) : super(key: key);
  final int movieID;

  @override
  State<DetailsPage> createState() => _DetailsPageState(actors,details,genres);
}

class _DetailsPageState extends State<DetailsPage> {
  final PageController _controller = PageController();
  final TMDBApply tmdbApply = TMDBApplyImpl();
  final CastApply castView = CastApplyImpl();
  final ActorsApply actorsView = ActorsApplyImpl();

  // get details => null;
  //
  // get actors => null;
  //
  // get genres => null;
  final List<ActorsVO> actors;
  final DetailsVO details;
  final GenresVO genres;





  _DetailsPageState(this.actors, this.details, this.genres);

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) => [
        SliverAppBarItemView(tmdbApply: tmdbApply,
            ) //SliverAppBarItemView()
       ],
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children:  [
                // MovieGenreAndStorylineItemView(details: details,
                //   genres: genres,
                //   index: ,),

                ActorsAndCreatorsSectionItemView(actors: actors,
                  pageController: _controller ,
                  title1: kBestActorsTitle,
                  title2: kMoreActors,),

                AboutFilmItemView(details: details,genres: genres,),

                ActorsAndCreatorsSectionItemView(actors: actors,
                  pageController: _controller,
                  title1: kCreators,
                  title2: kMoreCreators,),

                  BestPopularMovieItemView(title: kRelatedMovies, details: details, genres: genres,),

              ],
            ),
          )
    ));
  }
}
