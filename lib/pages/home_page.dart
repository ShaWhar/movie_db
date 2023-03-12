import 'package:flutter/material.dart';
import 'package:movie_db_zoom/constant/strings.dart';
import 'package:movie_db_zoom/data/apply/actors_apply.dart';
import 'package:movie_db_zoom/data/apply/cast_apply.dart';
import 'package:movie_db_zoom/data/apply/cast_apply_impl.dart';
import 'package:movie_db_zoom/data/apply/tmdb_apply.dart';
import 'package:movie_db_zoom/data/apply/tmdb_apply_impl.dart';
import '../constant/colors.dart';
import '../constant/dimes.dart';
import '../data/apply/actors_apply_impl.dart';
import '../home_page_item_views/banner_section_item_view.dart';
import '../home_page_item_views/actors_and_creators_section_item_view.dart';
import '../home_page_item_views/best_popular_movie_item_view.dart';
import '../home_page_item_views/check_movie_item_view.dart';
import '../home_page_item_views/show_case_section_item_view.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TMDBApply tmdbApply = TMDBApplyImpl();
  final PageController _controller = PageController();
  final CastApply castApply=CastApplyImpl();
  final ActorsApply actorsApply= ActorsApplyImpl();

  var details;
  var genres;


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
      backgroundColor: Colors.black38,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: kBackgroundColor,
        title: const Text(kAppTitle),
        leading: const Icon(
          Icons.menu,
          color: kWhiteColor,
        ),
        actions: const [
          Icon(
            Icons.search,
            color: kWhiteColor,
          ),
          SizedBox(
            width: kAppBarSizedBoxWidth,
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            ///Banner Section

            BannerSectionItemView(
                tmdbApply: tmdbApply, controller: _controller, details: details, genres: genres,),

            //  /Best Popular Movie And Serial Section
              BestPopularMovieItemView(title: kBestPopularMoviesTitle, details: details, genres: genres,),
            const CheckMovieItemView(),
            ShowCaseSectionItemView(
                tmdbApply: tmdbApply, controller: _controller, actors: [], genres: genres, details: details,),
            BestActorSectionItemView( controller: _controller, actorsApply: actorsApply ,),

          ],
        ),
      ),
    );
  }
}




